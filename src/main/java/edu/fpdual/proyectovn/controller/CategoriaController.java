package edu.fpdual.proyectovn.controller;

import edu.fpdual.proyectovn.model.connector.Connector;
import edu.fpdual.proyectovn.model.dao.Categoria;
import edu.fpdual.proyectovn.model.manager.CategoriaManager;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Set;

public class CategoriaController {

  private final CategoriaManager categoriaManager;
  public CategoriaController(CategoriaManager categoriaManager) {
    this.categoriaManager = categoriaManager;
  }

  public Set<Categoria> porActivCiudad() throws SQLException, ClassNotFoundException {
    Connection con = new Connector().getConnection();
    Set<Categoria> categoriaSet;
    return null;
  }

}
