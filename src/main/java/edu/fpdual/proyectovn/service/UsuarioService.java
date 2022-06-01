package edu.fpdual.proyectovn.service;

import edu.fpdual.proyectovn.model.connector.Connector;
import edu.fpdual.proyectovn.model.dao.Usuario;
import edu.fpdual.proyectovn.model.manager.UsuarioManager;
import edu.fpdual.proyectovn.model.manager.implement.UsuarioManagerImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Set;

public class UsuarioService {

  private final UsuarioManager usuarioManager;

  public UsuarioService(UsuarioManagerImpl usuarioManager) {
    this.usuarioManager = usuarioManager;
  }

  public Set<Usuario> todosUsuarios() throws SQLException, ClassNotFoundException {
    try (Connection con = new Connector().getConnection()) {
      return usuarioManager.todos(con);
    }
}
  public Usuario buscaIdUsuario(Integer id) throws SQLException, ClassNotFoundException {
    try (Connection con = new Connector().getConnection()) {
      return usuarioManager.buscaId(con, id);
    }
  }

  public boolean buscaEmailUsuario(String email) throws SQLException, ClassNotFoundException {
    try (Connection con = new Connector().getConnection()) {
      return usuarioManager.buscaEmail(con, email);
    }
  }

  public boolean crearUsuario(Usuario usuario) throws SQLException, ClassNotFoundException {
    try (Connection con = new Connector().getConnection()) {
      return usuarioManager.crear(con, usuario);
    }
  }

  public boolean modificarUsuario(Usuario usuario) throws SQLException, ClassNotFoundException {
    try (Connection con =new Connector().getConnection()) {
      return usuarioManager.modificar(con, usuario);
    }
  }

  public boolean borrarUsuario(Integer id) throws SQLException, ClassNotFoundException {
    try (Connection con =new Connector().getConnection()) {
      return usuarioManager.borrar(con, id);
    }
  }
}
