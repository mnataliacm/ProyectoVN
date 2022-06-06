package edu.fpdual.proyectovn.client.dto;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
@Builder

public class Reservas {
  private int idUsu;
  private int idAct;
  private Date fecha;
  private String hora;
}
