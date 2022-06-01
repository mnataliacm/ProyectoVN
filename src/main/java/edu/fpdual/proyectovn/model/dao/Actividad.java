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

public class Actividad {

  private int idact;
  private int idcat;
  private int idciu;
  private String nom;
  private int idemp;
  private String horario;
  private String info;

  public Actividad(ResultSet result) throws SQLException {
    this.idact = result.getInt("IDact");
    this.idcat = result.getInt("IDcat");
    this.idciu = result.getInt("IDciu");
    this.nom = result.getString("NomAct");
    this.idemp = result.getInt("IDemp");
    this.horario = result.getString("Horario");
    this.info = result.getString("Info");
  }
}
