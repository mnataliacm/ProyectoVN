package edu.fpdual.proyectovn.jdbc.manager.implement;

import edu.fpdual.proyectovn.jdbc.dao.Actividad;
import edu.fpdual.proyectovn.jdbc.manager.ActividadManager;

import java.sql.*;
import java.util.List;

public class ActividadManagerImpl implements ActividadManager {

  public ResultSet TodasActividades(Connection con) {
    try (Statement s = con.createStatement()) {
      ResultSet resultSet = s.executeQuery("SELECT * FROM actividad ");
      return resultSet;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }

  public boolean NuevaActividad(Connection con, String nom, int idemp, int idsub, String horario, int idciu) throws SQLException {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
    ResultSet resultSet = ps.executeQuery("INSERT INTO actividad (NomAct, IDemp, IDsub, Horario, IDciu) VALUES ("
        + " NomAct = ?"
        + ", IDemp = ?"
        + ", IDsub = ?"
        + ", Horario = ?"
        + ", IDciu = ?)");
    ps.setString(1, nom);
    ps.setInt(2, idemp);
    ps.setInt(3, idsub);
    ps.setString(4, horario);
    ps.setInt(5, idciu);
    return resultSet.rowUpdated();
  } catch (SQLException e) {
    e.printStackTrace();
    return false;
  }
}

  public boolean ModificaActividad(Connection con, String nom, int idemp, int idsub, String horario, int idciu, int idact) throws SQLException {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet resultSet = ps.executeQuery("UPDATE actividad SET "
          + "NomAct = ?"
          + ", IDemp = ?"
          + ", IDsub = ?"
          + ", Horario = ?"
          + ", IDciu = ?"
          + " WHERE IDact = ?");
      ps.setString(1, nom);
      ps.setInt(2, idemp);
      ps.setInt(3, idsub);
      ps.setString(4, horario);
      ps.setInt(5, idciu);
      ps.setInt(6, idact);
      return resultSet.rowUpdated();
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  public boolean BorraActividad(Connection con, int idact) {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet resultSet = ps.executeQuery("DELETE FROM actividad WHERE IDact = ?");
      ps.setInt(1, idact);
      return resultSet.rowDeleted();
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  public List ActividadesPorCiudad(Connection con, int idciu) {

    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      List<String> actividades = (List<String>) ps.executeQuery("SELECT * FROM actividad WHERE IDciu = ? GROUP BY NomAct");
      ps.setInt(1, idciu);
      return actividades;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }

}
