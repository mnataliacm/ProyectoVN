package edu.fpdual.proyectovn.client.dto;

import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@XmlRootElement
@Builder

public class Usuario {
  private Integer id;
  private String nom;
  private String ape;
  private String pass;
  private String email;
  private String movil;
  private Integer idciu;

  public Usuario(String nom, String ape, String pass, String email, String movil, Integer idciu) {
    this.nom = nom;
    this.ape = ape;
    this.pass = pass;
    this.email = email;
    this.movil = movil;
    this.idciu = idciu;
  }
}
