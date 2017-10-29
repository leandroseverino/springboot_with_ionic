package br.com.maxigenios.services;

import br.com.maxigenios.domain.Cliente;
import br.com.maxigenios.repositories.ClienteRepository;
import br.com.maxigenios.security.UserSS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


@Service
public class UserDetailServiceImpl implements UserDetailsService {

	@Autowired
	private ClienteRepository repo;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Cliente cli = repo.findByEmail(email);

		if (cli == null) {
			throw new UsernameNotFoundException(email);
		}

		return new UserSS(cli.getId(), cli.getEmail(), cli.getSenha(), cli.getPerfis());

	}
}
