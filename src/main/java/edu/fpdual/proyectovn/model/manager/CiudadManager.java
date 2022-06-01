package edu.fpdual.proyectovn.model.manager;


import edu.fpdual.proyectovn.model.dao.Ciudad;

import java.sql.Connection;
import java.util.Set;


public interface CiudadManager extends Manager<Ciudad, Integer>{

  /**
   * Busca todos los usuarios
   *
   * @param con conexión a BBDD
   * @return {@code Set} of {@code Ciudad}
   */
  Set<Ciudad> todos(Connection con);

  /**
   * Comprobar si usuario existe
   *
   * @param con conexión a BBDD
   * @param id  ID del usuario a buscar
   * @return a {@code Ciudad}
   */
  Ciudad buscaId(Connection con, Integer id);

  /**
   * Comprobar si usuario existe
   *
   * @param con conexión a BBDD
   * @param id  ID del usuario a buscar
   * @return a {@code String}
   */
  String nombreCiu(Connection con, Integer id);

  /**
   * Comprobar si usuario existe
   *
   * @param con conexión a BBDD
   * @param id  ID del usuario a buscar
   * @return {@code Set} of {@code Ciudad}
   */
  Set<Ciudad> ciudadesConActividades(Connection con, Integer id);

}
