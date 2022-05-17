package edu.fpdual.proyectovn.jdbc.manager.implement;


import edu.fpdual.proyectovn.jdbc.connector.Connector;
import edu.fpdual.proyectovn.jdbc.dao.Usuario;
import edu.fpdual.proyectovn.jdbc.manager.UsuarioManager;
import lombok.NoArgsConstructor;

import java.sql.*;
import java.util.LinkedList;


public class UsuarioManagerImpl implements UsuarioManager {
  Connector connector = new Connector();
  Connection con;

  {
    try {
      con = connector.getConnection();
    } catch (ClassNotFoundException e) {
      throw new RuntimeException(e);
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  PreparedStatement ps = null;

  public LinkedList<Usuario> TodosUsuarios() throws SQLException {
    LinkedList<Usuario> listado = new LinkedList<Usuario>();
    try {
      Statement s = con.createStatement();
      ResultSet resultSet = s.executeQuery("SELECT * FROM usuario");
      while (resultSet.next()) {
        Usuario usuario = new Usuario();
        usuario.getId();
        usuario.getNom();
        usuario.getApe();
        usuario.getPass();
        usuario.getEmail();
        usuario.getMovil();
        listado.add(usuario);
      }
      s.close();
      con.close();
      resultSet.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return listado;
  }

  public boolean NuevoUsuario(String nom, String ape, String email, String pass, String movil) {
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

  public boolean ModificarUsuario(String nom, String ape, String email, String pass, String movil, int id) {

    try {
      ps = con.prepareStatement("UPDATE usuario SET "
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

      return ps.execute();
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }


//    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
//      ResultSet resultSet = ps.executeQuery("UPDATE usuario SET "
//          + "NomUsu = ?"
//          + ", ApeUsu = ?"
//          + ", PassUsu = ?"
//          + ", Email = ?"
//          + ", Movil = ?"
//          + " WHERE IDusu = ?");
//      ps.setString(1, nom);
//      ps.setString(2, ape);
//      ps.setString(3, pass);
//      ps.setString(4, email);
//      ps.setString(5, movil);
//      ps.setInt(6, id);
//      return resultSet.rowUpdated();
//    } catch (SQLException e) {
//      e.printStackTrace();
//      return false;
//    }
  }

  public boolean BorraUsuario(int id) {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet resultSet = ps.executeQuery("DELETE FROM usuario WHERE IDusu = ?");
      ps.setInt(1, id);
      return resultSet.rowDeleted();
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  public boolean BuscarUserPorID(int id) {
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



