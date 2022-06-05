package edu.fpdual.proyectovn.model.manager.implement;

import edu.fpdual.proyectovn.model.dao.Ciudad;
import edu.fpdual.proyectovn.model.manager.CiudadManager;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class CiudadManagerImpl implements CiudadManager {

  @Override
  public Set<Ciudad> todos(Connection con) {
    try (Statement s = con.createStatement()) {
      ResultSet resultSet = s.executeQuery("SELECT * FROM ciudad ");
      Set<Ciudad> ciudadSet = new HashSet<>();
      resultSet.getRow();
      while (resultSet.next()) {
        Ciudad ciudad = new Ciudad(resultSet);
        ciudadSet.add(ciudad);
      }
      return ciudadSet;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }
  @Override
  public Ciudad buscaId(Connection con, Integer id) {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      String sql = "SELECT * FROM ciudad WHERE IDciu = ?";
      ps.setInt(1, id);
      ResultSet resultSet = ps.executeQuery(sql);
      resultSet.beforeFirst();
      Ciudad ciudad = null;
      while (resultSet.next()) {
        ciudad = new Ciudad(resultSet);
      }
      return ciudad;
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  public String nombreCiu(Connection con, Integer id) {
    Ciudad ciudad = buscaId(con, id);
    return ciudad.getNom();
  }

  public Set<Ciudad> ciudadesConActividades(Connection con, Integer id) {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet resultSet = ps.executeQuery("SELECT * FROM categoria c"
          + " INNER JOIN actividad a ON c.IDcat = a.IDcat"
          + " INNER JOIN ciudad ci ON a.IDciu = ci.IDciu"
          + " WHERE a.IDciu = ?");
      ps.setInt(1, id);
      Set<Ciudad> ciudadSet = new HashSet<>();
      resultSet.getRow();
      while (resultSet.next()) {
        Ciudad ciudad = new Ciudad(resultSet);
        ciudadSet.add(ciudad);
      }
      return ciudadSet;
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }


  @Override
  public boolean crear(Connection con, Ciudad ciudad) {
    return false;
  }
  @Override
  public boolean modificar(Connection con, Ciudad ciudad) {
    return false;
  }
  @Override
  public boolean borrar(Connection con, Integer id) {
    return false;
  }
  @Override
  public boolean buscaEmail(Connection con, String email) {
    return false;
  }

}
