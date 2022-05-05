package edu.fpdual.proyectovn.jdbc.manager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface ActividadManager {
  /**
   * Busca todas las actividades
   * @param con conexión a BBDD
   * @return {@code Set} of {@code Actividad}
   */
  public ResultSet TodasActividades(Connection con) throws SQLException;
  /**
   * Modifica una actividad
   * @param con conexión a BBDD
   * @param nom nuevo/mismo nombre
   * @param idemp nuevo/mismo ID de la empresa
   * @param idsub nuevo/mismo ID de subcategoria
   * @param horario nueva/mismo horario
   * @param idciu nuevo/mismo ID de la ciudad
   * @return {@code Set} of {@code Actividad}
   */
  public ResultSet ModificaActividad(Connection con, String nom, int idemp, int idsub, String horario, int idciu) throws SQLException;


}

