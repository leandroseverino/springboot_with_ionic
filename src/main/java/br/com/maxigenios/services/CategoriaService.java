package br.com.maxigenios.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import br.com.maxigenios.domain.Categoria;
import br.com.maxigenios.dto.CategoriaDTO;
import br.com.maxigenios.repositories.CategoriaRepository;
import br.com.maxigenios.services.exceptions.DataIntegrityException;
import br.com.maxigenios.services.exceptions.ObjectNotFoundException;


@Service
public class CategoriaService {

	@Autowired
	private CategoriaRepository repository;
	
	public List<Categoria> findAll() {
		return repository.findAll();
	}
	
	public Categoria findById(Integer id) {
		Categoria obj = repository.findOne(id);
		if (obj == null ) {
			throw new ObjectNotFoundException("Categoria não encontrada ! Id: " + id + ", Tipo: " + Categoria.class.getName());
		}
		return obj;
	}
	
	public Categoria insert(Categoria obj) {
		obj.setId(null);
		return repository.save(obj);
	}

	public Categoria update(Categoria obj) {
		Categoria newCategoria = findById(obj.getId());
		updateData(newCategoria, obj);
		return repository.save(newCategoria);
	}
	
	private void updateData(Categoria newCategoria, Categoria obj) {
		newCategoria.setNome(obj.getNome());
	}

	public void delete(Integer id) {
		findById(id);
		try {
			repository.delete(id);	
		} catch (DataIntegrityViolationException e) {
			throw new DataIntegrityException("Não é possível excluir uma categoria que possuí produtos");
		}
		
	}
	
	public Categoria fromDTO(CategoriaDTO dto) {
		return new Categoria(dto.getId(), dto.getNome());
	}
	
	public Page<Categoria> findPage(Integer page, Integer linesPerPage, String orderBy, String direction) {
		PageRequest pageRequest = new PageRequest(page, linesPerPage, Direction.valueOf(direction), orderBy);
		return repository.findAll(pageRequest);
	}
}
