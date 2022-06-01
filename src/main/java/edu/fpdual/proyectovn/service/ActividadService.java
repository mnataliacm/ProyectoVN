package edu.fpdual.proyectovn.service;

import edu.fpdual.proyectovn.model.connector.Connector;
import edu.fpdual.proyectovn.model.dao.Actividad;
import edu.fpdual.proyectovn.model.dao.Usuario;
import edu.fpdual.proyectovn.model.manager.ActividadManager;
import edu.fpdual.proyectovn.model.manager.implement.ActividadManagerImpl;
import edu.fpdual.proyectovn.model.manager.implement.UsuarioManagerImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Set;

public class ActividadService {

  private final ActividadManager actividadManager;

  public ActividadService(ActividadManagerImpl actividadManager) {
    this.actividadManager = actividadManager;
  }

  public Set<Actividad> todasActividades() throws SQLException, ClassNotFoundException {
    try (Connection con = new Connector().getConnection()) {
      return actividadManager.todos(con);
    }
  }

  public boolean crearActividad(Actividad actividad) throws SQLException, ClassNotFoundException {
    try (Connection con = new Connector().getConnection()) {
      return actividadManager.crear(con, actividad);
    }
  }

  public boolean modificarActividad(Actividad actividad) throws SQLException, ClassNotFoundException {
    try (Connection con =new Connector().getConnection()) {
      return actividadManager.modificar(con, actividad);
    }
  }

  public boolean borrarActividad(Integer id) throws SQLException, ClassNotFoundException {
    try (Connection con =new Connector().getConnection()) {
      return actividadManager.borrar(con, id);
    }
  }
}
