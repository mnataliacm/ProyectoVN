package edu.fpdual.proyectovn.jdbc.manager.implement;

import edu.fpdual.proyectovn.jdbc.manager.CategoriaManager;

import java.sql.*;

public class CategoriaManagerImpl implements CategoriaManager {

  public ResultSet TodasCategorias(Connection con) throws SQLException {
   try (Statement s = con.createStatement()) {
    ResultSet result = s.executeQuery("SELECT * FROM categoria ");
    return result;
  } catch (SQLException e) {
    e.printStackTrace();
    return null;
  }
}
  public ResultSet CatConAct(Connection con, int id) throws SQLException{
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet result = ps.executeQuery("SELECT DISTINCT(NomCat), COUNT(a.NomAct) AS total FROM categoria c"
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
