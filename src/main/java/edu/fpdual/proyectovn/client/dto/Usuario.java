package edu.fpdual.proyectovn.client.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Usuario {
  private Integer id;
  private String nom;
  private String ape;
  private String pass;
  private String email;
  private String movil;
  private Integer ciu;
}
