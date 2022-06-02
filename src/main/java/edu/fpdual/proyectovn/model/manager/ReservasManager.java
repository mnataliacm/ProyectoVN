package edu.fpdual.proyectovn.model.manager;

import edu.fpdual.proyectovn.model.dao.Empresa;
import edu.fpdual.proyectovn.model.dao.Reservas;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

public interface ReservasManager {

    /**
     * Busca todos las empresas
     *
     * @param con conexión a BBDD
     * @return {@code Set} of {@code Usuario}
     */
    Set<Reservas> todos(Connection con);
    /**
     * Busca todos las reservas
     * @param con conexión a BBDD
     * @return {@code Set} of {@code Usuario}
     */
}
