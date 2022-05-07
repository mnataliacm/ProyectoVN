package edu.fpdual.proyectovn.jdbc.manager.implement;


import edu.fpdual.proyectovn.jdbc.dao.Empresa;
import edu.fpdual.proyectovn.jdbc.manager.ReservasManager;

import java.sql.*;

public class ReservasManagerImpl implements ReservasManager {

    public ResultSet TodosReserva(Connection con) throws SQLException {
        try (Statement s = con.createStatement()) {
            ResultSet result = s.executeQuery("SELECT * FROM reserva ");
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }



}
