package edu.fpdual.proyectovn.controller;

import edu.fpdual.proyectovn.model.connector.Connector;
import edu.fpdual.proyectovn.model.dao.Actividad;
import edu.fpdual.proyectovn.model.manager.ActividadManager;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Set;

public class ActividadController {
  private final ActividadManager actividadManager;

  public ActividadController(ActividadManager actividadManager) {
    this.actividadManager = actividadManager;
  }

  public Set<Actividad> todasActividades() throws SQLException, ClassNotFoundException {
    Connection con = new Connector().getConnection();
    Set<Actividad> actividadSet = actividadManager.todos(con);
    for (Actividad a : actividadSet) {
      a.setNom(a.getNom().toUpperCase().charAt(0) + a.getNom().substring(1).toLowerCase());
      // TODO: 31/05/2022 añadir formato horario
    }
    return actividadManager.todos(con);
  }

}
