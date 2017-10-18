/**
 * 
 */
package br.com.maxigenios.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.maxigenios.domain.Cidade;

/**
 * @author Leandro Severino - https://about.me/leandroseverino
 *
 */
@Repository
public interface CidadeRepository extends JpaRepository<Cidade, Integer> {

}
