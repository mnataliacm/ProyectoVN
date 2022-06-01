package edu.fpdual.proyectovn.model.manager;

import java.sql.Connection;
import java.util.Set;

public interface Manager<T, U> {

  /**
   * Muestra todas las entidades
   *
   * @param con Conexión BD
   * @return {@link Set} of {@link T}
   */
  Set<T> todos(Connection con);

  /**
   * Crea una entidad
   *
   * @param con DB connection
   * @param entity The entity to create
   * @return a {@link int}
   */
  boolean crear(Connection con, T entity);

  /**
   * Modificar una entidad
   *
   * @param con DB connection
   * @param entity The entity to update
   * @return a {@link boolean}
   */
  boolean modificar(Connection con, T entity);

  /**
   * Borrar una entidad
   *
   * @param con DB connection
   * @param id Entities id to delete.
   * @return a {@link boolean}
   */
  boolean borrar(Connection con, U id);

  /**
   * Finds all the entities in the DB based on a list of ids.
   *
   * @param con DB connection
   * @param id Entities id to search for.
   * @return a {@link T}
   */

  T buscaId(Connection con, U id);

  /**
   * Finds all the entities in the DB based on a list of ids.
   *
   * @param con DB connection
   * @param email Entities email to search for.
   * @return a {@link boolean}
   */
  boolean buscaEmail(Connection con, String email);

  /**
   * Devuelve el total de lineas
   *
   * @param con DB connection
   * @return a {@link int}
   */
  int total(Connection con);

  /**
   * Finds all the entities in the DB based on a list of ids.
   *
   * @param con DB connection
   * @return a {@link Set} of {@link T}
   */
  /*Set<T> ordenarId(Connection con) throws SQLException;*/
}

