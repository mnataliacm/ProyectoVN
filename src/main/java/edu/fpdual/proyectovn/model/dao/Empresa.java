package edu.fpdual.proyectovn.model.dao;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder

public class Empresa {

    private int id;
    private String nom;
    //private int idciu;

    public Empresa(ResultSet result) {
        try {
            this.id = result.getInt("IDemp");
            this.nom = result.getString("NomEmp");
            //this.idciu = result.getInt("IDciu");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
