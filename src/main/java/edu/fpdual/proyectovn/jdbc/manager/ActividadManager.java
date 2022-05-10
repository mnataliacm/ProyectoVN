package edu.fpdual.proyectovn.jdbc.manager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface ActividadManager {
  /**
   * Busca todas las actividades
   * @param con conexión a BBDD
   * @return {@code Set} of {@code Actividad}
   */
  public ResultSet TodasActividades(Connection con);
  /**
   * Modifica una actividad
   * @param con conexión a BBDD
   * @param nom nuevo nombre
   * @param idemp nuevo ID de la empresa
   * @param idsub nuevo ID de subcategoria
   * @param horario nueva horario
   * @param idciu nuevo ID de la ciudad
   * @return {@code boolean} of {@code Actividad}
   */
  public boolean NuevaActividad(Connection con, String nom, int idemp, int idsub, String horario, int idciu) throws SQLException;

  /**
   * Modifica una actividad
   * @param con conexión a BBDD
   * @param nom nuevo/mismo nombre
   * @param idemp nuevo/mismo ID de la empresa
   * @param idsub nuevo/mismo ID de subcategoria
   * @param horario nuevo/mismo horario
   * @param idciu nuevo/mismo ID de la ciudad
   * @param idact ID de la actividad a modificar
   * @return {@code boolean} of {@code Actividad}
   */
  public boolean ModificaActividad(Connection con, String nom, int idemp, int idsub, String horario, int idciu, int idact) throws SQLException;

  /**
   * Borrar una actividad
   *
   * @param con   conexión a BBDD
   * @param idact ID de la actividad a borrar
   * @return {@code boolean} of {@code Actividad}
   */
  public boolean BorraActividad(Connection con, int idact);

  /**
   * Busca las actividad según la ciudad elegida
   *
   * @param con   conexión a BBDD
   * @param idact ID de la actividad a borrar
   * @return {@code List} of {@code Actividad}
   */
  public List ActividadesPorCiudad(Connection con, int idact);
}

