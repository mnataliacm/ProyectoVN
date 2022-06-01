package edu.fpdual.proyectovn.controller;

import edu.fpdual.proyectovn.model.connector.Connector;
import edu.fpdual.proyectovn.model.dao.Empresa;
import edu.fpdual.proyectovn.model.manager.EmpresaManager;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Set;

public class EmpresaController {

  private final EmpresaManager empresaManager;

  public EmpresaController(final EmpresaManager empresaManager) {
    this.empresaManager = empresaManager;
  }
  public Set<Empresa> todasEmpresas() throws SQLException, ClassNotFoundException {
    Connection con = new Connector().getConnection();
    Set<Empresa> empresaSet = empresaManager.todos(con);
    for (Empresa e : empresaSet) {
      e.setNom(e.getNom().toUpperCase().charAt(0) + e.getNom().substring(1).toLowerCase());
    }
    return empresaSet;
  }


}
