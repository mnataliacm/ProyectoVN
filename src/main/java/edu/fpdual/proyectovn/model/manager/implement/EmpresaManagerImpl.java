package edu.fpdual.proyectovn.model.manager.implement;


import edu.fpdual.proyectovn.model.dao.Empresa;
import edu.fpdual.proyectovn.model.manager.EmpresaManager;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class EmpresaManagerImpl implements EmpresaManager {

  @Override
  public Set<Empresa> todos(Connection con) {
    try (Statement s = con.createStatement()) {
      ResultSet resultSet = s.executeQuery("SELECT * FROM empresa ");
      Set<Empresa> empresaSet = new HashSet<>();
      resultSet.getRow();
      while (resultSet.next()) {
        Empresa empresa = new Empresa(resultSet);
        empresaSet.add(empresa);
      }
      return empresaSet;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }



  public ResultSet modificarEmpresa (Connection con, String nomEmp, Integer idCiu, Integer idEmp ) throws SQLException {
    try (Statement s = con.createStatement()) {
      ResultSet result = s.executeQuery("UPDATE empresa SET "
          + "NomEmp = '" + nomEmp
          + "' WHERE IDemp = " + idEmp);

      return result ;
    } catch (SQLException e) {
      e.printStackTrace();

      return null;
    }

  }
}
