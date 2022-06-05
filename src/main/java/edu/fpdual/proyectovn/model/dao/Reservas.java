package edu.fpdual.proyectovn.model.dao;

import lombok.*;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString

public class Reservas {
    private int idRes;
    private int idUsu;
    private int idAct;
    private Time hora;
    private Date fecha;
    public Reservas(ResultSet result) throws SQLException {
        setIdRes(result.getInt("IDres"));
        setIdUsu(result.getInt("IDusu"));
        setIdAct(result.getInt("IDact"));
        setHora(result.getTime("Hora"));
        setFecha(result.getDate("Fecha"));
    }
}
