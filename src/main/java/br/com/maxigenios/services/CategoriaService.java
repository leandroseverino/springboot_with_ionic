package br.com.maxigenios.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.maxigenios.domain.Categoria;
import br.com.maxigenios.repositories.CategoriaRepository;
import br.com.maxigenios.services.exceptions.ObjectNotFoundException;


@Service
public class CategoriaService {

	@Autowired
	private CategoriaRepository repository;
	
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

}
