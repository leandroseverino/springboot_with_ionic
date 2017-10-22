package br.com.maxigenios.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.maxigenios.domain.Pedido;
import br.com.maxigenios.repositories.PedidoRepository;
import br.com.maxigenios.services.exceptions.ObjectNotFoundException;


@Service
public class PedidoService {

	@Autowired
	private PedidoRepository repository;
	
	public Pedido findById(Integer id) {
		Pedido obj = repository.findOne(id);
		if (obj == null ) {
			throw new ObjectNotFoundException("Pedido não encontrado ! Id: " + id + ", Tipo: " + Pedido.class.getName());
		}
		return obj;
	}

}
