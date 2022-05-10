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
   * @param id ID del usuario a modificar
   * @return {@code Set} of {@code Usuario}
   */
  public ResultSet ModificarUsuario(Connection con, String nom, String ape, String email, String pass, String movil, int id) throws SQLException;
  /**
   * Borra un usuario
   * @param con conexión a BBDD
   * @param id ID del usuario a borrar
   * @return {@code Set} of {@code Usuario}
   */
  public ResultSet BorraUsuario(Connection con, int id) throws SQLException;

}
