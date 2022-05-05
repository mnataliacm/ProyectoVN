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

  public String CiudadPorID(Connection con, int id) {
    try (Statement s = con.createStatement()) {
      String ciudad = String.valueOf(s.executeQuery("SELECT NomCiu FROM ciudad WHERE IDciu = " + id));
      return ciudad;
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
  public List CiudadesConActividades(Connection con, int id) {
    try (Statement s = con.createStatement()) {
      List result = (List) s.executeQuery("SELECT DISTINCT NomCiu FROM categoria c"
          + " INNER JOIN subcategoria s ON c.IDcat = s.IDcat"
          + " INNER JOIN actividad a ON s.IDsub = a.IDsub"
          + " INNER JOIN ciudad ci ON a.IDciu = ci.IDciu"
          + " WHERE a.IDciu = " + id);
      return result;
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }


}
