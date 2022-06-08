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

public class Categoria {
  private Integer id;
  private String nom;
  private String imagen;
}
