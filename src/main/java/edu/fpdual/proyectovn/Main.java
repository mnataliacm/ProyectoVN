package edu.fpdual.proyectovn;

import edu.fpdual.proyectovn.client.CategoriaClient;
import edu.fpdual.proyectovn.client.CiudadClient;

public class Main {

  public static void main(String[] args) {

    System.out.println(new CiudadClient().crear());
    System.out.println(new CategoriaClient().crear());
  }
}
