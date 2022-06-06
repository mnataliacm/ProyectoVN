package edu.fpdual.proyectovn.controller;

import edu.fpdual.proyectovn.model.connector.Connector;
import edu.fpdual.proyectovn.client.dto.Usuario;
import edu.fpdual.proyectovn.service.UsuarioService;
import jakarta.ws.rs.core.Response;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Set;

public class UsuarioController {
  private final UsuarioService usuarioService;
  Connection con = new Connector().getConnection();
  public UsuarioController(UsuarioService usuarioService) throws SQLException, ClassNotFoundException {
    this.usuarioService = usuarioService;
  }
  public Set<Usuario> todosUsuarios() throws SQLException, ClassNotFoundException {

    Set<Usuario> usuarioSet = usuarioService.todosUsuarios();
    for (Usuario u : usuarioSet) {
      u.setNom(u.getNom().toUpperCase().charAt(0) + u.getNom().substring(1).toLowerCase());
      u.setApe(u.getApe().toUpperCase().charAt(0) + u.getApe().substring(1).toLowerCase());
    }
    return usuarioSet;
  }
  public boolean nuevoUsuario(Usuario usuario) {
    if (usuarioService.crearUsuario(usuario)) {
      return true;
    } else {
      return false;
    }
  }
}
