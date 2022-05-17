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
@Builder

public class Usuario {

  private int id;
  private String nom;
  private String ape;
  private String email;
  private String pass;
  private String movil;

  public Usuario(ResultSet result) throws SQLException {
    setId(result.getInt("IDusu"));
    setNom(result.getString("NomUsu"));
    setApe(result.getString("ApeUsu"));
    setEmail(result.getString("Email"));
    setPass(result.getString("PassUsu"));
    setMovil(result.getString("Movil"));
  }

}
