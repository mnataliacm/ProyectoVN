package edu.fpdual.proyectovn.jdbc.manager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface FavoritosManager {
  /**
   * Busca todas las actividades
   * @param con conexión a BBDD
   * @param id id del usuario
   * @return {@code int} of {@code Favoritos}
   */
  public int CiudadFavorita(Connection con, int id) throws SQLException;
  /**
   * Busca todas las actividades
   * @param con conexión a BBDD
   * @param idusu id del usuario
   * @param idciu id de la ciudad
   * @return {@code Boolean} of {@code Favoritos}
   */
  public boolean CambioFavorita(Connection con, int idusu, int idciu) throws SQLException;

}


