package edu.fpdual.proyectovn.jdbc.manager;

import edu.fpdual.proyectovn.jdbc.dao.Usuario;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Set;

public interface UsuarioManager {

  /**
   * Busca todos los usuarios
   * @param con conexión a BBDD
   * @return {@code Set} of {@code Usuario}
   */
  public Set<Usuario> todosUsuarios(Connection con);

}
