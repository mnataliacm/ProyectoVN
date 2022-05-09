package edu.fpdual.proyectovn.jdbc.manager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface ReservasManager {
    /**
     * Busca todos las reservas
     * @param con conexión a BBDD
     * @return {@code Set} of {@code Usuario}
     */
    public ResultSet TodosReserva(Connection con) throws SQLException;
}
