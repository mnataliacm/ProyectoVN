package edu.fpdual.proyectovn.model.manager.implement;

import edu.fpdual.proyectovn.model.dao.Actividad;
import edu.fpdual.proyectovn.model.manager.ActividadManager;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class ActividadManagerImpl implements ActividadManager {

  @Override
  public Set<Actividad> todos(Connection con) {
    try (Statement s = con.createStatement()) {
      ResultSet resultSet = s.executeQuery("SELECT * FROM actividad ");
      Set<Actividad> actividadSet = new HashSet<>();
      resultSet.getRow();
      while (resultSet.next()) {
        Actividad actividad = new Actividad(resultSet);
        actividadSet.add(actividad);
      }
      return actividadSet;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }

  public Set<Actividad> actividadesPorCiudad(Connection con, Integer idciu, Integer idcat) {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      String sql = "SELECT * FROM categoria c"
          + " JOIN actividad a ON (c.IDcat = a.IDcat)"
          + " JOIN ciudad ci ON (a.IDciu = ci.IDciu)\n"
          + " WHERE a.IDciu = ?"
          + " AND a.IDcat = ?";
      ps.setInt(1, idciu);
      ps.setInt(2, idcat);
      ResultSet resultSet = ps.executeQuery(sql);
      Set<Actividad> actividadSet = new HashSet<>();
      resultSet.beforeFirst();
      while (resultSet.next()) {
        Actividad actividad = new Actividad(resultSet);
        actividadSet.add(actividad);
      }
      return actividadSet;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }

@Override
  public int total(Connection con) {
      Set<Actividad> actividadSet = todos(con);
  return actividadSet.size();
  }

  @Override
  public Actividad buscaId(Connection con, Integer id) {
    return null;
  }

  @Override
  public boolean buscaEmail(Connection con, String email) {
    return false;
  }

  @Override
  public boolean crear(Connection con, Actividad actividad) {
    return false;
  }

  @Override
  public boolean modificar(Connection con, Actividad actividad) {
    return false;
  }

  @Override
  public boolean borrar(Connection con, Integer id) {
    return false;
  }



}
