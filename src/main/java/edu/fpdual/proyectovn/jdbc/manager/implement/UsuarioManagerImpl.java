package edu.fpdual.proyectovn.jdbc.manager.implement;


import edu.fpdual.proyectovn.jdbc.manager.UsuarioManager;

import java.sql.*;

public class UsuarioManagerImpl implements UsuarioManager {

  public ResultSet todosUsuarios(Connection con) throws SQLException {
    try (Statement s = con.createStatement()) {
      ResultSet result = s.executeQuery("SELECT * FROM usuario ");
      return result;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }
}
