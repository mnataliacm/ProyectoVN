package edu.fpdual.proyectovn.jdbc.manager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


public interface UsuarioManager {

  /**
   * Busca todos los usuarios
   * @param con conexión a BBDD
   * @return {@code Set} of {@code Usuario}
   */
  public ResultSet todosUsuarios(Connection con) throws SQLException;

}
