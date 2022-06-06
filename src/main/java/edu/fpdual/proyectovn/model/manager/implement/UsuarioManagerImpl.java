package edu.fpdual.proyectovn.model.manager.implement;

import edu.fpdual.proyectovn.model.dao.Usuario;
import edu.fpdual.proyectovn.model.manager.UsuarioManager;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class UsuarioManagerImpl implements UsuarioManager {

  @Override
  public Set<Usuario> todos(Connection con) {
    try (Statement s = con.createStatement()) {
      ResultSet resultSet = s.executeQuery("SELECT * FROM usuario");
      Set<Usuario> usuarioSet = new HashSet<>();
      resultSet.getRow();
      while (resultSet.next()) {
        Usuario usuario = new Usuario(resultSet);
        usuarioSet.add(usuario);
      }
      return usuarioSet;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }

  @Override
  public Usuario buscaId(Connection con, Integer id) {
    String sql = "SELECT * FROM usuario WHERE IDusu = ?";
    try (PreparedStatement ps = con.prepareStatement(sql)) {
      ps.setInt(1, id);
      ResultSet resultSet = ps.executeQuery();
      resultSet.beforeFirst();
      Usuario usuario = null;
      while (resultSet.next()) {
        usuario = new Usuario(resultSet);
      }
      return usuario;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }

  @Override
  public boolean buscaEmail(Connection con, String email) {
    String sql = "SELECT * FROM usuario WHERE Email = ?";
    try (PreparedStatement ps = con.prepareStatement(sql)) {
      ps.setString(1, email);
      ResultSet resultSet = ps.executeQuery();
      return resultSet.first();
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  @Override
  public boolean crear(Connection con, Usuario usuario) {
    //prepare SQL statement
    String sql = "INSERT INTO usuario (NomUsu, ApeUsu, PassUsu, Email, Movil, IDciu) VALUES (?, ?, ?, ?, ?, ?)";
    try (PreparedStatement ps = con.prepareStatement(sql)) {
      ps.setString(1, usuario.getNom());
      ps.setString(2, usuario.getApe());
      ps.setString(3, usuario.getPass());
      ps.setString(4, usuario.getEmail());
      ps.setString(5, usuario.getMovil());
      ps.setInt(6, usuario.getCiu());
      // Queries the DB
      int affectedRows = ps.executeUpdate();
      if (affectedRows <= 0) {
        return false;
      }
      return true;
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  @Override
  public boolean modificar(Connection con, Usuario usuario) {
    //prepare SQL statement
    String sql = "UPDATE usuario SET NomUsu=?, ApeUsu=?, PassUsu=? , Email=? , Movil=? WHERE IDusu = ?";

    // Create general statement
    try (PreparedStatement ps = con.prepareStatement(sql)) {
      //Add Parameters
      ps.setString(1, usuario.getNom());
      ps.setString(2, usuario.getApe());
      ps.setString(3, usuario.getPass());
      ps.setString(4, usuario.getEmail());
      ps.setString(5, usuario.getMovil());
      ps.setInt(6, usuario.getId());
      // Queries the DB
      return ps.executeUpdate() > 0;

    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  @Override
  public boolean borrar(Connection con, Integer id) {
    //prepare SQL statement
    String sql = "DELETE FROM usuario WHERE IDusu = ?";

    // Create general statement
    try (PreparedStatement ps = con.prepareStatement(sql)) {
      //Add Parameters
      ps.setInt(1, id);
      // Queries the DB
      return ps.executeUpdate() > 0;

    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }
}



