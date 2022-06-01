package edu.fpdual.proyectovn.model.manager;

import edu.fpdual.proyectovn.model.dao.Actividad;
import edu.fpdual.proyectovn.model.dao.Usuario;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

public interface ActividadManager extends Manager<Actividad, Integer> {

  /**
   * Busca todas las actividades
   * @param con conexión a BBDD
   * @return {@code Set} of {@code Actividad}
   */
  Set<Actividad> todos(Connection con);

  /**
   * Comprobar si usuario existe
   *
   * @param con conexión a BBDD
   * @param id  ID de la actividad a buscar
   * @return a {@code Actividad}
   */
  Actividad buscaId(Connection con, Integer id);

  /**
   * Modifica datos de un usuario
   *
   * @param con   conexión a BBDD
   * @param actividad   nuevo/mismo nombre
   * @return a {@code boolean}
   */
  boolean crear(Connection con, Actividad actividad);

  /**
   * Modifica datos de un usuario
   *
   * @param con   conexión a BBDD
   * @param actividad  nuevo/mismo nombre
   * @return a {@code boolean}
   */
  boolean modificar(Connection con, Actividad actividad);

  /**
   * Borra un usuario
   *
   * @param con conexión a BBDD
   * @param id  ID del usuario a borrar
   * @return a {@code boolean}
   */
  boolean borrar(Connection con, Integer id);

  /**
   * Busca las actividades según la ciudad elegida
   *
   * @param con   conexión a BBDD
   * @param idciu ID de la ciudad para agrupar
   * @return {@code List} of {@code Actividad}
   */
  Set<Actividad> actividadesPorCiudad(Connection con, Integer idciu, Integer idcat);

  /**
   * Busca las actividades según la ciudad elegida
   *
   * @param con   conexión a BBDD
   * @return a {@code int}
   */
  int total(Connection con);
}

