/**
 * 
 */
package br.com.maxigenios.repositories;

import br.com.maxigenios.domain.Cliente;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.maxigenios.domain.Pedido;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Leandro Severino - https://about.me/leandroseverino
 *
 */
@Repository
public interface PedidoRepository extends JpaRepository<Pedido, Integer> {

    @Transactional(readOnly=true)
    Page<Pedido> findByCliente(Cliente cliente, Pageable pageRequest);
}
