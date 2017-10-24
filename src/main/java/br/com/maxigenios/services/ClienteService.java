package br.com.maxigenios.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import br.com.maxigenios.domain.Cliente;
import br.com.maxigenios.dto.ClienteDTO;
import br.com.maxigenios.repositories.ClienteRepository;
import br.com.maxigenios.services.exceptions.DataIntegrityException;
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
	
	public List<Cliente> findAll() {
		return repository.findAll();
	}
	
	public Cliente insert(Cliente obj) {
		obj.setId(null);
		return repository.save(obj);
	}

	public Cliente update(Cliente obj) {
		Cliente newObj = findById(obj.getId());
		updateData(newObj, obj);
		return repository.save(newObj);
	}
	
	private void updateData(Cliente newObj, Cliente obj) {
		newObj.setNome(obj.getNome());
		newObj.setEmail(obj.getEmail());
	}

	public void delete(Integer id) {
		findById(id);
		try {
			repository.delete(id);	
		} catch (DataIntegrityViolationException e) {
			throw new DataIntegrityException("Não é possível excluir um Cliente que possuí entidades relacionadas !");
		}
		
	}
	
	public Cliente fromDTO(ClienteDTO dto) {
		return new Cliente(dto.getId(), dto.getNome(), dto.getEmail(), null, null);
	}
	
	public Page<Cliente> findPage(Integer page, Integer linesPerPage, String orderBy, String direction) {
		PageRequest pageRequest = new PageRequest(page, linesPerPage, Direction.valueOf(direction), orderBy);
		return repository.findAll(pageRequest);
	}

}
