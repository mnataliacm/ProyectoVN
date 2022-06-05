package edu.fpdual.proyectovn.controller;

import edu.fpdual.proyectovn.model.connector.Connector;
import edu.fpdual.proyectovn.model.dao.Usuario;
import edu.fpdual.proyectovn.model.manager.UsuarioManager;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Set;

public class UsuarioController {
  private final UsuarioManager usuarioManager;
  Connection con = new Connector().getConnection();
  public UsuarioController(UsuarioManager usuarioManager) throws SQLException, ClassNotFoundException {
    this.usuarioManager = usuarioManager;
  }
  public Set<Usuario> todosUsuarios() {

    Set<Usuario> usuarioSet = usuarioManager.todos(con);
    for (Usuario u : usuarioSet) {
      u.setNom(u.getNom().toUpperCase().charAt(0) + u.getNom().substring(1).toLowerCase());
      u.setApe(u.getApe().toUpperCase().charAt(0) + u.getApe().substring(1).toLowerCase());
    }
    return usuarioSet;
  }
  public boolean nuevoUsuario(Usuario usuario) {
    if (usuarioManager.crear(con, usuario)) {
      return true;
    } else {
      return false;
    }
  }
}
