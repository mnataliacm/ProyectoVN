package edu.fpdual.proyectovn.model.manager.implement;

import edu.fpdual.proyectovn.model.dao.Categoria;
import edu.fpdual.proyectovn.model.manager.CategoriaManager;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class CategoriaManagerImpl implements CategoriaManager {

  public Set<Categoria> todos(Connection con) throws SQLException {
   try (Statement s = con.createStatement()) {
    ResultSet resultSet = s.executeQuery("SELECT * FROM categoria ");
    Set<Categoria> categoriaSet = new HashSet<>();
    resultSet.getRow();
    while (resultSet.next()) {
      Categoria categoria = new Categoria(resultSet);
      categoriaSet.add(categoria);
    }
    return categoriaSet;
  } catch (SQLException e) {
    e.printStackTrace();
    return null;
  }
}

  public Set<Categoria> catConAct(Connection con, Integer id) throws SQLException{
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      // TODO: 31/05/2022 arreglas query y revisar todo falta añadir Set<>
      /*ResultSet result = ps.executeQuery("SELECT DISTINCT(NomCat), COUNT(a.NomAct) AS total FROM categoria c"
          + " INNER JOIN actividad a ON c.IDsub = a.IDsub"
          + " INNER JOIN ciudad ci ON a.IDciu = ci.IDciu"
          + " WHERE a.IDciu = ?");
      ps.setInt(1, id);
      return result;*/
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
    return null;
  }


}
