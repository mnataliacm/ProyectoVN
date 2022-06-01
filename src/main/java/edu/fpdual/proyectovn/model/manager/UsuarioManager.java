package edu.fpdual.proyectovn.model.manager;

import edu.fpdual.proyectovn.model.dao.Usuario;

import java.sql.Connection;
import java.util.Set;


public interface UsuarioManager extends Manager<Usuario, Integer> {

  /**
   * Busca todos los usuarios
   *
   * @param con conexión a BBDD
   * @return {@code Set} of {@code Usuario}
   */
  Set<Usuario> todos(Connection con);

  /**
   * Comprobar si usuario existe
   *
   * @param con conexión a BBDD
   * @param id  ID del usuario a buscar
   * @return a {@code Usuario}
   */
  Usuario buscaId(Connection con, Integer id);

  /**
   * Finds all the entities in the DB based on a list of ids.
   *
   * @param con   DB connection
   * @param email Entities email to search for.
   * @return a {@code boolean}
   */
  boolean buscaEmail(Connection con, String email);

  /**
   * Modifica datos de un usuario
   *
   * @param con   conexión a BBDD
   * @param usuario   nuevo/mismo nombre
   * @return a {@code boolean}
   */
  boolean crear(Connection con, Usuario usuario);

  /**
   * Modifica datos de un usuario
   *
   * @param con   conexión a BBDD
   * @param usuario   nuevo/mismo nombre
   * @return a {@code boolean}
   */
  boolean modificar(Connection con, Usuario usuario);

  /**
   * Borra un usuario
   *
   * @param con conexión a BBDD
   * @param id  ID del usuario a borrar
   * @return a {@code boolean}
   */
  boolean borrar(Connection con, Integer id);

}
