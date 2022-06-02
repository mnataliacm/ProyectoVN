package edu.fpdual.proyectovn.model.manager.implement;


import edu.fpdual.proyectovn.model.dao.Empresa;
import edu.fpdual.proyectovn.model.dao.Reservas;
import edu.fpdual.proyectovn.model.manager.EmpresaManager;
import edu.fpdual.proyectovn.model.manager.ReservasManager;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class ReservasManagerImpl implements ReservasManager {

    @Override
    public Set<Reservas> todos(Connection con) {
        try (Statement s = con.createStatement()) {
            ResultSet resultSet = s.executeQuery("SELECT * FROM reserva ");
            Set<Reservas> reservasSet = new HashSet<>();
            resultSet.getRow();
            while (resultSet.next()) {
                Reservas reservas = new Reservas(resultSet);
                reservasSet.add(reservas);
            }
            return reservasSet;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }




}
