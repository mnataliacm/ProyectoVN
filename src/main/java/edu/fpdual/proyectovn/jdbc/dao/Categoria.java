package edu.fpdual.proyectovn.jdbc.dao;

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

  public Categoria(ResultSet result) throws SQLException {
    setId(result.getInt("IDcat"));
    setNom(result.getString("NomCat"));
    setImagen(result.getString("Imagen"));
  }

}
