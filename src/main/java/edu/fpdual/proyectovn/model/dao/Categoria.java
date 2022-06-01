package edu.fpdual.proyectovn.model.dao;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString

public class Categoria {

  private int id;
  private String nom;
  private String imagen;

  public Categoria(ResultSet result) {
    try {
      this.id = result.getInt("IDcat");
      this.nom = result.getString("NomCat");
      this.imagen = result.getString("Imagen");
    } catch (SQLException e) {
      e.printStackTrace();
    }

  }

}
