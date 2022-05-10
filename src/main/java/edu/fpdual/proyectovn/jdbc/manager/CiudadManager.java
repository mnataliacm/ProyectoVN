package edu.fpdual.proyectovn.jdbc.manager;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


public interface CiudadManager {

  /**
   * Busca todas las ciudades
   *
   * @param con conexión a BBDD
   * @return {@code Set} of {@code Ciudad}
   */
  public ResultSet TodasCiudades(Connection con) throws SQLException;

  /**
   * Busca nombre de la ciudad por ID
   *
   * @param con conexión a BBDD
   * @param id  ID de la ciudad seleccionada
   * @return {@code String} nombre de la ciudad
   */
  public ResultSet CiudadPorID(Connection con, int id) throws SQLException;

  /**
   * Busca ciudades que tienen actividades
   *
   * @param con conexión a BBDD
   * @param id  ID de la ciudad seleccionada
   * @return {@code List} of {@code Ciudad}
   */
  public ResultSet CiudadesConActividades(Connection con, int id) throws SQLException;

}
