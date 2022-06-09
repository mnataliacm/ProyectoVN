package edu.fpdual.proyectovn.client.dto;

import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Time;

@Data
@AllArgsConstructor
@NoArgsConstructor
@XmlRootElement
@Builder

public class Reservas {
  private int idRes;
  private int idUsu;
  private int idAct;
  private Date fecha;
  private Time hora;

  public Reservas(String nom, String ape, Time hora, Date fecha, Integer idAct, Integer idUsu) {
    this.hora = hora;
    this.fecha = fecha;
    this.idAct = idAct;
    this.idUsu = idUsu;
  }
}


