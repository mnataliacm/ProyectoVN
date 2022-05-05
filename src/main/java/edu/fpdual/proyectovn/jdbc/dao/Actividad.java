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

public class Actividad {

  private int id;
  private String nom;
  private int idEmp;
  private int idSub;
  private String horario;
  private int idCiu;

  public Actividad(ResultSet result) throws SQLException {
    setId(result.getInt("IDact"));
    setNom(result.getString("NomAct"));
    setIdEmp(result.getInt("IDemp"));
    setIdSub(result.getInt("IDsub"));
    setHorario(result.getString("Horario"));
    setIdCiu(result.getInt("IDciu"));
  }

}
