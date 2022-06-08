package edu.fpdual.proyectovn.client.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Actividad {
  private Integer id;
  private Integer idcat;
  private Integer idciu;
  private String nom;
  private Integer idemp;
  private String horario;
  private String info;
}
