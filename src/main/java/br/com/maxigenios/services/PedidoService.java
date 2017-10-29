package br.com.maxigenios.services;

import java.util.Date;

import br.com.maxigenios.domain.Cliente;
import br.com.maxigenios.domain.enums.Perfil;
import br.com.maxigenios.security.UserSS;
import br.com.maxigenios.services.exceptions.AuthorizationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import br.com.maxigenios.domain.ItemPedido;
import br.com.maxigenios.domain.PagamentoComBoleto;
import br.com.maxigenios.domain.Pedido;
import br.com.maxigenios.domain.enums.EstadoPagamento;
import br.com.maxigenios.repositories.ClienteRepository;
import br.com.maxigenios.repositories.ItemPedidoRepository;
import br.com.maxigenios.repositories.PagamentoRepository;
import br.com.maxigenios.repositories.PedidoRepository;
import br.com.maxigenios.repositories.ProdutoRepository;
import br.com.maxigenios.services.exceptions.ObjectNotFoundException;


@Service
public class PedidoService {

	@Autowired
	private PedidoRepository repository;
	
	@Autowired
	private PagamentoRepository repositoryPagamento;
	
	@Autowired
	private ProdutoRepository repositoryProduto;
	
	@Autowired
	private ItemPedidoRepository repositoryItemPedido;
	
	@Autowired
	private BoletoService boletoService;
	
	@Autowired
	private ClienteRepository repositoryCliente;
	
	@Autowired
	private EmailService emailService;
	
	public Pedido findById(Integer id) {
		Pedido obj = repository.findOne(id);
		if (obj == null ) {
			throw new ObjectNotFoundException("Pedido não encontrado ! Id: " + id + ", Tipo: " + Pedido.class.getName());
		}
		return obj;
	}
	
	public Pedido insert(Pedido pedido) {
		pedido.setId(null);
		pedido.setCliente(repositoryCliente.findOne(pedido.getCliente().getId()));
		pedido.setInstante(new Date());
		pedido.getPagamento().setEstado(EstadoPagamento.PENDENTE);
		pedido.getPagamento().setPedido(pedido);
		if (pedido.getPagamento() instanceof PagamentoComBoleto) {
			PagamentoComBoleto pagto = (PagamentoComBoleto) pedido.getPagamento();
			boletoService.preencherPagamentoComBoleto(pagto, pedido.getInstante());
		}
		
		pedido = repository.save(pedido);
		repositoryPagamento.save(pedido.getPagamento());
		
		for (ItemPedido itemPedido : pedido.getItens()) {
			itemPedido.setDesconto(0.0);
			itemPedido.setProduto(repositoryProduto.findOne(itemPedido.getProduto().getId()));
			itemPedido.setPreco(itemPedido.getProduto().getPreco());
			itemPedido.setPedido(pedido);
		}
		
		repositoryItemPedido.save(pedido.getItens());
		
		emailService.sendOrderConfirmationEmail(pedido);
		
		return pedido;
	}

	public Page<Pedido> findPage(Integer page, Integer linesPerPage, String orderBy, String direction) {
		UserSS userSS = UserService.authenticated();

		if (userSS == null) {
			throw new AuthorizationException("Acesso negado !");
		}

		Cliente cliente = repositoryCliente.findOne(userSS.getId());

		PageRequest pageRequest = new PageRequest(page, linesPerPage, Direction.valueOf(direction), orderBy);
		return repository.findByCliente(cliente, pageRequest);
	}

}
