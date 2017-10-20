/**
 * 
 */
package br.com.maxigenios.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.maxigenios.domain.Endereco;

/**
 * @author Leandro Severino - https://about.me/leandroseverino
 *
 */
@Repository
public interface EnderecoRepository extends JpaRepository<Endereco, Integer> {

}
