/**
 * 
 */
package br.com.maxigenios.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.maxigenios.domain.Estado;

/**
 * @author Leandro Severino - https://about.me/leandroseverino
 *
 */
@Repository
public interface EstadoRepository extends JpaRepository<Estado, Integer> {

}
