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

  public boolean NuevoUsuario(Connection con, String nom, String ape, String email, String pass, String movil) {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet resultSet = ps.executeQuery("INSERT INTO usuario VALUES ("
          + "NomUsu = ?"
          + ", ApeUsu = ?"
          + ", PassUsu = ?"
          + ", Email = ?"
          + ", Movil = ?)");
      ps.setString(1, nom);
      ps.setString(2, ape);
      ps.setString(3, pass);
      ps.setString(4, email);
      ps.setString(5, movil);
      return resultSet.rowInserted();
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  public boolean ModificarUsuario(Connection con, String nom, String ape, String email, String pass, String movil, int id) {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet resultSet = ps.executeQuery("UPDATE usuario SET "
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
      return resultSet.rowUpdated();
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  public boolean BorraUsuario(Connection con, int id)  {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet resultSet = ps.executeQuery("DELETE FROM usuario WHERE IDusu = ?");
      ps.setInt(1, id);
      return resultSet.rowDeleted();
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  public boolean BuscarUserPorID(Connection con, int id) {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet result = ps.executeQuery("SELECT * FROM usuario WHERE IDusu = ?");
      ps.setInt(1, id);
      return true;
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

}



