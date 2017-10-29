package br.com.maxigenios.services;

import java.util.List;

import br.com.maxigenios.domain.enums.Perfil;
import br.com.maxigenios.security.UserSS;
import br.com.maxigenios.services.exceptions.AuthorizationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import br.com.maxigenios.domain.Cidade;
import br.com.maxigenios.domain.Cliente;
import br.com.maxigenios.domain.Endereco;
import br.com.maxigenios.domain.enums.TipoCliente;
import br.com.maxigenios.dto.ClienteDTO;
import br.com.maxigenios.dto.ClienteNewDTO;
import br.com.maxigenios.repositories.CidadeRepository;
import br.com.maxigenios.repositories.ClienteRepository;
import br.com.maxigenios.repositories.EnderecoRepository;
import br.com.maxigenios.services.exceptions.DataIntegrityException;
import br.com.maxigenios.services.exceptions.ObjectNotFoundException;


@Service
public class ClienteService {

	@Autowired
	private ClienteRepository repository;
	
	@Autowired
	private CidadeRepository cidadeRepository;
	
	@Autowired
	private EnderecoRepository enderecoRepository;
	
	@Autowired
	private BCryptPasswordEncoder pwdEnconder;
	
	public Cliente findById(Integer id) {

        UserSS userSS = UserService.authenticated();

        if (userSS == null || ! userSS.hasRole(Perfil.ADMIN) && !id.equals(userSS.getId())) {
            throw new AuthorizationException("Acesso negado !");
        }

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
		obj = repository.save(obj);
		enderecoRepository.save(obj.getEnderecos());
		return obj;
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
		return new Cliente(dto.getId(), dto.getNome(), dto.getEmail(), null, null, null);
	}
	
	public Cliente fromDTO(ClienteNewDTO dto) {
		Cliente cli = new Cliente(null, dto.getNome(), dto.getEmail(), dto.getCpfOuCnpj(), TipoCliente.toEnum(dto.getTipo()), pwdEnconder.encode(dto.getSenha()));
		Cidade cid = cidadeRepository.findOne(dto.getCidadeId());
		Endereco end = new Endereco(null, dto.getLogradouro(), dto.getNumero(), dto.getComplemento(), dto.getBairro(), dto.getCep(), cli, cid);
		cli.getEnderecos().add(end);
		cli.getTelefones().add(dto.getTelefone1());
		
		if (dto.getTelefone2() != null) {
			cli.getTelefones().add(dto.getTelefone2());
		}
		
		if (dto.getTelefone3() != null) {
			cli.getTelefones().add(dto.getTelefone3());
		}
		
		return cli;
	}
	
	public Page<Cliente> findPage(Integer page, Integer linesPerPage, String orderBy, String direction) {
		PageRequest pageRequest = new PageRequest(page, linesPerPage, Direction.valueOf(direction), orderBy);
		return repository.findAll(pageRequest);
	}

}
