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
  private Integer idRes;
  private Integer idUsu;
  private Integer idAct;
  private Date fecha;
  private Time hora;

  public Reservas(Integer idUsu, Integer idAct, Date fecha, Time hora) {
    this.idUsu = idUsu;
    this.idAct = idAct;
    this.fecha = fecha;
    this.hora = hora;
  }
}


