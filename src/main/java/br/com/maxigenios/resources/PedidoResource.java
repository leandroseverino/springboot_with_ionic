package br.com.maxigenios.resources;

import java.net.URI;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import br.com.maxigenios.domain.Pedido;
import br.com.maxigenios.services.PedidoService;

@RestController
@RequestMapping(value = "/pedido")
public class PedidoResource {

    @Autowired
    private PedidoService service;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Pedido> findById(@PathVariable Integer id) {
        Pedido obj = service.findById(id);
        return ResponseEntity.ok().body(obj);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Void> insert(@Valid @RequestBody Pedido pedido) {
        Pedido obj = service.insert(pedido);
        URI uri = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}").buildAndExpand(obj.getId()).toUri();
        return ResponseEntity.created(uri).build();
    }

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<Page<Pedido>> findPage(@RequestParam(value = "page", defaultValue = "0") Integer page,
                                                 @RequestParam(value = "linesPerPage", defaultValue = "24") Integer linesPerPage,
                                                 @RequestParam(value = "orderBy", defaultValue = "instante") String orderBy,
                                                 @RequestParam(value = "direction", defaultValue = "DESC") String direction) {

        Page<Pedido> list = service.findPage(page, linesPerPage, orderBy, direction);

        return ResponseEntity.ok().body(list);
    }

}
