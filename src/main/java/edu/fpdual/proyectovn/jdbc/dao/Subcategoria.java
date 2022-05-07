package edu.fpdual.proyectovn.jdbc.dao;

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

public class Subcategoria {

    private int idSub;
    private int idCat;
    private String nomSub;

    public Subcategoria(ResultSet result) throws SQLException {
        setIdSub(result.getInt("IDsub"));
        setIdCat(result.getInt("IDcat"));
        setNomSub(result.getString("NomSub"));
    }

}
