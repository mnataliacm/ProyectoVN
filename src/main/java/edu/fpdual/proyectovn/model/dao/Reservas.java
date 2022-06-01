package edu.fpdual.proyectovn.model.dao;

import lombok.*;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString

public class Reservas {

    private int idUsu;
    private int idAct;
    private Date fecha;
    private String hora;

    public Reservas(ResultSet result) throws SQLException {
        setIdUsu(result.getInt("IDusu"));
        setIdAct(result.getInt("IDact"));
        setFecha(result.getDate("Fecha"));
        setHora(result.getString("Hora"));
    }

}
