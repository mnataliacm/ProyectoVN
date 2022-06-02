package edu.fpdual.proyectovn.model.manager;

import edu.fpdual.proyectovn.model.dao.Reservas;

import java.sql.Connection;
import java.util.Set;

public interface ReservasManager extends Manager<Reservas, Integer> {

    /**
     * Busca todas las reservas
     *
     * @param con conexión a BBDD
     * @return {@code Set} of {@code Reserva}
     */
    Set<Reservas> todos(Connection con);

}
