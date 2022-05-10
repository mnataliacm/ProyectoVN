package edu.fpdual.proyectovn.jdbc.manager.implement;


import edu.fpdual.proyectovn.jdbc.manager.CiudadManager;

import java.sql.*;
import java.util.List;

public class CiudadManagerImpl implements CiudadManager {

  public ResultSet TodasCiudades(Connection con) throws SQLException {
    try (Statement s = con.createStatement()) {
      ResultSet result = s.executeQuery("SELECT * FROM ciudad ");
      return result;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }

  public ResultSet CiudadPorID(Connection con, int id) {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet ciudad = ps.executeQuery("SELECT NomCiu FROM ciudad WHERE IDciu = ?");
      ps.setInt(1, id);
      return ciudad;
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
  public ResultSet CiudadesConActividades(Connection con, int id) {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet result = ps.executeQuery("SELECT DISTINCT NomCiu FROM categoria c"
          + " INNER JOIN subcategoria s ON c.IDcat = s.IDcat"
          + " INNER JOIN actividad a ON s.IDsub = a.IDsub"
          + " INNER JOIN ciudad ci ON a.IDciu = ci.IDciu"
          + " WHERE a.IDciu = ?");
      ps.setInt(1, id);
      return result;
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }


}
