package edu.fpdual.proyectovn.jdbc.controller;

import edu.fpdual.proyectovn.jdbc.connector.Connector;
import edu.fpdual.proyectovn.jdbc.dao.Usuario;
import edu.fpdual.proyectovn.jdbc.manager.UsuarioManager;
import edu.fpdual.proyectovn.jdbc.manager.implement.UsuarioManagerImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Set;

public class UsuarioController {

  private final edu.fpdual.proyectovn.jdbc.manager.UsuarioManager usuarioManager;
  private UsuarioManager UsuarioManager;

  public UsuarioController (final UsuarioManager usuarioManager){
    this.usuarioManager = usuarioManager;
  }

  public Set<Usuario> todosUsuarios(Connection con) throws SQLException, ClassNotFoundException {
    Set<Usuario> usuarios = todosUsuarios(con);

    for(Usuario u : usuarios){
      u.setNom(u.getNom().toUpperCase());
    }

    return usuarios;
  }

  /*public Set<Ciudad> encuentraCiudadPorId(Connection con, String id) throws SQLException, ClassNotFoundException {

    return usuarioManager.encuentraCiudadPorId(con, id);
  }*/
}
