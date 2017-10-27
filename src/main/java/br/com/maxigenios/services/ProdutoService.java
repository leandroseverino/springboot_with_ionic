package br.com.maxigenios.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import br.com.maxigenios.domain.Categoria;
import br.com.maxigenios.domain.Produto;
import br.com.maxigenios.repositories.CategoriaRepository;
import br.com.maxigenios.repositories.ProdutoRepository;
import br.com.maxigenios.services.exceptions.ObjectNotFoundException;


@Service
public class ProdutoService {

	@Autowired
	private ProdutoRepository repository;
	
	@Autowired
	private CategoriaRepository repositoryCategoria;
	
	public List<Produto> findAll() {
		return repository.findAll();
	}
	
	public Produto findById(Integer id) {
		Produto obj = repository.findOne(id);
		if (obj == null ) {
			throw new ObjectNotFoundException("Produto não encontrada ! Id: " + id + ", Tipo: " + Produto.class.getName());
		}
		return obj;
	}
	
	public Page<Produto> search(String nome, List<Integer> ids, Integer page, Integer linesPerPage, String orderBy, String direction) {
		PageRequest pageRequest = new PageRequest(page, linesPerPage, Direction.valueOf(direction), orderBy);
		List<Categoria> categorias = repositoryCategoria.findAll(ids);
		//return repository.search(nome, categorias, pageRequest);
		return repository.findDistinctByNomeContainingAndCategoriasIn(nome, categorias, pageRequest);
	}
	
//	
//	public Produto insert(Produto obj) {
//		obj.setId(null);
//		return repository.save(obj);
//	}
//
//	public Produto update(Produto obj) {
//		Produto newProduto = findById(obj.getId());
//		updateData(newProduto, obj);
//		return repository.save(newProduto);
//	}
//	
//	private void updateData(Produto newProduto, Produto obj) {
//		newProduto.setNome(obj.getNome());
//	}
//
//	public void delete(Integer id) {
//		findById(id);
//		try {
//			repository.delete(id);	
//		} catch (DataIntegrityViolationException e) {
//			throw new DataIntegrityException("Não é possível excluir uma categoria que possuí produtos");
//		}
//		
//	}
//	
//	public Produto fromDTO(ProdutoDTO dto) {
//		return new Produto(dto.getId(), dto.getNome());
//	}
	
	public Page<Produto> findPage(Integer page, Integer linesPerPage, String orderBy, String direction) {
		PageRequest pageRequest = new PageRequest(page, linesPerPage, Direction.valueOf(direction), orderBy);
		return repository.findAll(pageRequest);
	}
}
