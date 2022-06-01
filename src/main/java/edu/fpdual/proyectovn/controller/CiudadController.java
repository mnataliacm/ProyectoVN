package edu.fpdual.proyectovn.controller;

import edu.fpdual.proyectovn.model.connector.Connector;
import edu.fpdual.proyectovn.model.dao.Ciudad;
import edu.fpdual.proyectovn.model.manager.CiudadManager;

import java.sql.Connection;
import java.sql.SQLException;

public class CiudadController {
  private final CiudadManager ciudadManager;
  public CiudadController(CiudadManager ciudadManager) {
    this.ciudadManager = ciudadManager;
  }

  public String nombreCiudad(Integer id) throws SQLException, ClassNotFoundException {
    Connection con = new Connector().getConnection();
    Ciudad ciudad = ciudadManager.buscaId(con, id);
    return ciudad.getNom();
  }
}
