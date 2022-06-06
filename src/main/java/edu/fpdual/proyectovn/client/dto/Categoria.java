package edu.fpdual.proyectovn.client.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
@Builder

public class Categoria {
  private Integer id;
  private String nom;
  private String imagen;
}
