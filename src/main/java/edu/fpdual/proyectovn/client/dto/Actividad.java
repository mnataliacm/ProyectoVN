package edu.fpdual.proyectovn.client.dto;

import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.ResultSet;

@Data
@AllArgsConstructor
@NoArgsConstructor
@XmlRootElement
@Builder

public class Actividad {
  private Integer id;
  private Integer idcat;
  private Integer idciu;
  private String nom;
  private Integer idemp;
  private String horario;
  private String info;

  public Actividad(Integer idcat, Integer idciu, String nom, Integer idemp, String horario, String info) {
    this.idcat = idcat;
    this.idciu = idciu;
    this.nom = nom;
    this.idemp = idemp;
    this.horario = horario;
    this.info = info;
  }

  public Actividad(ResultSet resultSet) {
  }
}
