package edu.fpdual.proyectovn.client.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Time;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Reservas {
  private int idUsu;
  private int idAct;
  private Date fecha;
  private Time hora;
}
