package edu.fpdual.proyectovn.jdbc.manager.implement;

import java.sql.*;

public class ActividadManagerImpl {

  public ResultSet TodasActividades(Connection con) throws SQLException {
    try (Statement s = con.createStatement()) {
      ResultSet result = s.executeQuery("SELECT * FROM actividad ");
      return result;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }

  public boolean ModificaActividad(Connection con, int idact, String nom, int idemp, int idsub, String horario, int idciu) throws SQLException {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet result = ps.executeQuery("UPDATE actividad SET "
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
      return true;
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  public boolean BorraActividad(Connection con, int id) throws SQLException {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet result = ps.executeQuery("DELETE FROM actividad WHERE IDact = ?");
      ps.setInt(1, id);
      return true;
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

}
