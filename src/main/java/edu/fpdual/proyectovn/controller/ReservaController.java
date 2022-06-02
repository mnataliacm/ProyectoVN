package edu.fpdual.proyectovn.controller;

import edu.fpdual.proyectovn.model.connector.Connector;
import edu.fpdual.proyectovn.model.dao.Reservas;
import edu.fpdual.proyectovn.model.manager.ReservasManager;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Set;

public class ReservaController {

    private final ReservasManager reservasManager;

    public ReservaController(final ReservasManager reservasManager) {
        this.reservasManager = reservasManager;
    }
    public Set<Reservas> todasReservas() throws SQLException, ClassNotFoundException {
        Connection con = new Connector().getConnection();
        Set<Reservas> reservaSet = reservasManager.todos(con);
        for (Reservas e : reservaSet) {
            e.setIdres(e.getIdres() + e.getIdres());
        }
        return reservaSet;
    }
}

