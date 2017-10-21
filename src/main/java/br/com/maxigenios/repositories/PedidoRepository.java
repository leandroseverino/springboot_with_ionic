/**
 * 
 */
package br.com.maxigenios.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.maxigenios.domain.Pedido;

/**
 * @author Leandro Severino - https://about.me/leandroseverino
 *
 */
@Repository
public interface PedidoRepository extends JpaRepository<Pedido, Integer> {

}
