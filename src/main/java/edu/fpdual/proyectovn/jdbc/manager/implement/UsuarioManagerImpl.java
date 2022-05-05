package edu.fpdual.proyectovn.jdbc.manager.implement;


import edu.fpdual.proyectovn.jdbc.manager.UsuarioManager;

import java.sql.*;

public class UsuarioManagerImpl implements UsuarioManager {

  public ResultSet TodosUsuarios(Connection con) throws SQLException {
    try (Statement s = con.createStatement()) {
      ResultSet result = s.executeQuery("SELECT * FROM usuario");
      return result;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }

  public ResultSet ModificarUsuario(Connection con, String nom, String ape, String email, String pass, String movil, int id) throws SQLException {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet result = ps.executeQuery("UPDATE usuario SET "
          + "NomUsu = ?"
          + ", ApeUsu = ?"
          + ", PassUsu = ?"
          + ", Email = ?"
          + ", Movil = ?"
          + " WHERE IDusu = ?");
      ps.setString(1, nom);
      ps.setString(2, ape);
      ps.setString(3, pass);
      ps.setString(4, email);
      ps.setString(5, movil);
      ps.setInt(6, id);
      return result;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }

  public ResultSet BorraUsuario(Connection con, int id) throws SQLException {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet result = ps.executeQuery("DELETE FROM usuario WHERE IDusu = ?");
      ps.setInt(1, id);
      return result;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }


}



