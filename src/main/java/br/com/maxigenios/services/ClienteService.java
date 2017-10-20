package br.com.maxigenios.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.maxigenios.domain.Cliente;
import br.com.maxigenios.repositories.ClienteRepository;
import br.com.maxigenios.services.exceptions.ObjectNotFoundException;


@Service
public class ClienteService {

	@Autowired
	private ClienteRepository repository;
	
	public Cliente findById(Integer id) {
		Cliente obj = repository.findOne(id);
		if (obj == null ) {
			throw new ObjectNotFoundException("Cliente não encontrado ! Id: " + id + ", Tipo: " + Cliente.class.getName());
		}
		return obj;
	}

}
