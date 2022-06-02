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

  public ResultSet modificarEmpresa (Connection con, String nomEmp, Integer idCiu, Integer idEmp ) {
    try (Statement s = con.createStatement()) {

      return s.executeQuery("UPDATE empresa SET "
          + "NomEmp = '" + nomEmp
          + "' WHERE IDemp = " + idEmp);
    } catch (SQLException e) {
      e.printStackTrace();

      return null;
    }

  }


  @Override
  public boolean crear(Connection con, Empresa entity) {
    return false;
  }

  @Override
  public boolean modificar(Connection con, Empresa entity) {
    return false;
  }

  @Override
  public boolean borrar(Connection con, Integer id) {
    return false;
  }

  @Override
  public Empresa buscaId(Connection con, Integer id) {
    return null;
  }

  @Override
  public boolean buscaEmail(Connection con, String email) {
    return false;
  }

  @Override
  public int total(Connection con) {
    return 0;
  }

}
