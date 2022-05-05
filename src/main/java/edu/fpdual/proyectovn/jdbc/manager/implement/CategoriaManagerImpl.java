package edu.fpdual.proyectovn.jdbc.manager.implement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CategoriaManagerImpl {

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
    try (Statement s = con.createStatement()) {
      ResultSet result = s.executeQuery("SELECT DISTINCT NomCat, COUNT(a.NomAct) AS total FROM categoria c"
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
