package edu.fpdual.proyectovn.jdbc.manager.implement;

import edu.fpdual.proyectovn.jdbc.dao.Usuario;
import edu.fpdual.proyectovn.jdbc.manager.UsuarioManager;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class UsuarioManagerImpl implements UsuarioManager {

  @Override
  public Set<Usuario> todosUsuarios(Connection con) {
    try (Statement s = con.createStatement()) {
      ResultSet result = s.executeQuery("SELECT * FROM usuario ");

      Set<Usuario> usuarioSet = new HashSet<>();
      //result.beforeFirst();
      while (result.next()) {
        Usuario usuarios = new Usuario(result);
        usuarioSet.add(usuarios);
      }
      return usuarioSet;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }
}
