/**
 * 
 */
package br.com.maxigenios.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.maxigenios.domain.Cliente;

/**
 * @author Leandro Severino - https://about.me/leandroseverino
 *
 */
@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Integer> {

	@Transactional(readOnly=true)
	Cliente findByEmail(String email);
	
}
