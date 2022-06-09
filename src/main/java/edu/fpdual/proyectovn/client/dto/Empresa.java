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

public class Empresa {
  private int idEmp;
  private String nomEmp;
  public Empresa(String nomEmp,  Integer idEmp) {
    this.idEmp = idEmp;
    this.nomEmp = nomEmp;

  }
}
