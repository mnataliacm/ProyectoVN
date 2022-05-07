package edu.fpdual.proyectovn.jdbc.dao;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString

public class Empresa {

    private int idEmp;
    private String nomEmp;
    private int idCiu;


    public Empresa(ResultSet result) throws SQLException {
        setIdEmp(result.getInt("IDemp"));
        setNomEmp(result.getString("NomEmp"));
        setIdCiu(result.getInt("IDciu"));
    }
}
