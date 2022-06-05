package edu.fpdual.proyectovn.enumeration;

import lombok.Getter;

@Getter
public enum Ciudad {
  ALMERIA(04, "Almería"),
  GRANADA(18, "Granada"),
  MALAGA(29, "Málaga"),
  CADIZ(11, "Cádiz"),
  HUELVA(21, "Huelva"),
  SEVILLA(41, "Sevilla"),
  CORDOBA(14, "Córdoba"),
  JAEN(23, "Jaén");

  private int id;
  private String nom;

  Ciudad (int id, String nombre) {
    this.id = id;
    this.nom = nombre;
  }
}
