package edu.fpdual.proyectovn.client.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
@Builder

public class Actividad {
  private Integer id;
  private Integer idcat;
  private Integer idciu;
  private String nom;
  private Integer idemp;
  private String horario;
  private String info;
}
