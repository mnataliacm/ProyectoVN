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

public class Empresa {
  private Integer id;
  private String nomEmp;

  public Empresa(String nomEmp) {
    this.nomEmp = nomEmp;
  }
}
