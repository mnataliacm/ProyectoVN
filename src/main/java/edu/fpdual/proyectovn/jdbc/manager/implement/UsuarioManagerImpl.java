package edu.fpdual.proyectovn.jdbc.manager.implement;


import edu.fpdual.proyectovn.jdbc.manager.UsuarioManager;

import java.sql.*;

public class UsuarioManagerImpl implements UsuarioManager {

  public ResultSet TodosUsuarios(Connection con) throws SQLException {
    try (Statement s = con.createStatement()) {
      ResultSet result = s.executeQuery("SELECT * FROM usuario ");
      return result;
    } catch (SQLException e) {
      e.printStackTrace();
      return null;
    }
  }
    public ResultSet ModificarUsuario (Connection con, String nom, String ape, String email, String pass, String movil, int id ) throws SQLException {
      try (Statement s = con.createStatement()) {
        ResultSet result = s.executeQuery("UPDATE usuario SET "
                + "NomUsu = '" + nom
                + "', ApeUsu = '" + ape
                + "', PassUsu = '" + pass
                + "', Email = '" + email
                + "', Movil = '" + movil
                + "' WHERE IDusu = " + id);


        return result ;
      } catch (SQLException e) {
        e.printStackTrace();

        return null;
      }

    }
  }

