package edu.fpdual.proyectovn.model.manager;

import edu.fpdual.proyectovn.model.dao.Categoria;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

public interface CategoriaManager {
  /**
   * Busca todas las actividades
   * @param con conexión a BBDD
   * @return {@code Set} of {@code Categoria}
   */
  Set<Categoria> todos(Connection con) throws SQLException;
  /**
   * Busca todas las categorias que tienen alguna actividad filtrando por ciudad seleccionada
   * y las cuenta con el alias total
   * @param con conexión a BBDD
   * @return {@code Set} of {@code Categorias}
   */
  Set<Categoria> catConAct(Connection con, Integer id) throws SQLException;
}

