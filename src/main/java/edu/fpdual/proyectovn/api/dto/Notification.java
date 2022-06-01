package edu.fpdual.proyectovn.api.dto;

import jakarta.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@AllArgsConstructor
@NoArgsConstructor
@XmlRootElement
public class Notification {

  private int id;
  private String title;
  private String body;

}