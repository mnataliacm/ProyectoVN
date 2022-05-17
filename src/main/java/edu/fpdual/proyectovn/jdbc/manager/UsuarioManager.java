package edu.fpdual.proyectovn.jdbc.manager;

import edu.fpdual.proyectovn.jdbc.dao.Usuario;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public interface UsuarioManager {

  /**
   * Busca todos los usuarios
   * @return {@code Set} of {@code Usuario}
   */
  public LinkedList<Usuario> TodosUsuarios() throws SQLException;
  /**
   * Modifica datos de un usuario
   * @param nom nuevo/mismo nombre
   * @param ape nuevo/mismo apellido
   * @param email nuevo/mismo email
   * @param pass nueva/mismo pass
   * @param movil nuevo/mismo movil
   * @return {@code Set} of {@code Usuario}
   */

  public boolean NuevoUsuario(String nom, String ape, String email, String pass, String movil);
  /**
   * Modifica datos de un usuario
   * @param nom nuevo/mismo nombre
   * @param ape nuevo/mismo apellido
   * @param email nuevo/mismo email
   * @param pass nueva/mismo pass
   * @param movil nuevo/mismo movil
   * @param id ID del usuario a modificar
   * @return {@code boolean} of {@code Usuario}
   */
  public boolean ModificarUsuario(String nom, String ape, String email, String pass, String movil, int id);
  /**
   * Borra un usuario
   * @param id ID del usuario a borrar
   * @return {@code Set} of {@code Usuario}
   */
  public boolean BorraUsuario(int id);
  /**
   * Comprobar si usuario existe
   * @param id ID del usuario a buscar
   * @return {@code Set} of {@code Usuario}
   */
  public boolean BuscarUserPorID(int id);

}
