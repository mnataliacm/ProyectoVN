package edu.fpdual.proyectovn.jdbc.manager.implement;

import java.sql.*;

public class FavoritosManagerImpl {

  public int CiudadFavorita(Connection con, int id) throws SQLException {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet result= ps.executeQuery("SELECT IDciu FROM favoritos WHERE IDusu = ?");
      ps.setInt(1, id);
      int favorita = result.getInt("IDciu");
      return favorita;

    } catch (SQLException e) {
      e.printStackTrace();
      return 0;
    }
  }

  public boolean CambioFavorita(Connection con, int idusu, int idciu) throws SQLException {
    try (PreparedStatement ps = (PreparedStatement) con.createStatement()) {
      ResultSet result = ps.executeQuery("UPDATE favoritos SET "
          + "IDusu = ?, IDciu = ?");
      ps.setInt(1, idusu);
      ps.setInt(2, idciu);
      return true;
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }


}

