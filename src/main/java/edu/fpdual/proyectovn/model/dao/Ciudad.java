package edu.fpdual.proyectovn.model.dao;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder

public class Ciudad {
  private int id;
  private String nom;
  public Ciudad(ResultSet result) {
    try {
      this.id = result.getInt("IDciu");
      this.nom = result.getString("NomCiu");
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
