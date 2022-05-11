package edu.fpdual.proyectovn.jdbc.manager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


public interface UsuarioManager {

  /**
   * Busca todos los usuarios
   * @param con conexión a BBDD
   * @return {@code Set} of {@code Usuario}
   */
  public ResultSet TodosUsuarios(Connection con) throws SQLException;
  /**
   * Modifica datos de un usuario
   * @param con conexión a BBDD
   * @param nom nuevo/mismo nombre
   * @param ape nuevo/mismo apellido
   * @param email nuevo/mismo email
   * @param pass nueva/mismo pass
   * @param movil nuevo/mismo movil
   * @return {@code Set} of {@code Usuario}
   */

  public boolean NuevoUsuario(Connection con, String nom, String ape, String email, String pass, String movil);
  /**
   * Modifica datos de un usuario
   * @param con conexión a BBDD
   * @param nom nuevo/mismo nombre
   * @param ape nuevo/mismo apellido
   * @param email nuevo/mismo email
   * @param pass nueva/mismo pass
   * @param movil nuevo/mismo movil
   * @param id ID del usuario a modificar
   * @return {@code boolean} of {@code Usuario}
   */
  public boolean ModificarUsuario(Connection con, String nom, String ape, String email, String pass, String movil, int id);
  /**
   * Borra un usuario
   * @param con conexión a BBDD
   * @param id ID del usuario a borrar
   * @return {@code Set} of {@code Usuario}
   */
  public boolean BorraUsuario(Connection con, int id);
  /**
   * Comprobar si usuario existe
   * @param con conexión a BBDD
   * @param id ID del usuario a buscar
   * @return {@code Set} of {@code Usuario}
   */
  public boolean BuscarUserPorID(Connection con, int id);

}
