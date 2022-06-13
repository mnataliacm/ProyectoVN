package edu.fpdual.proyectovn.client;

import edu.fpdual.proyectovn.client.dto.Categoria;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;

import java.util.*;

public class CategoriaClient {
  private final WebTarget webTarget;

  public CategoriaClient() {
    Client client = ClientBuilder.newClient();
    this.webTarget = client.target("http://localhost:8081/WebServiceVN/api/");
  }

  public Set<Categoria> todos() {
    return new HashSet<>(Arrays.asList(webTarget.path("categoria")
        .request(MediaType.APPLICATION_JSON)
        .get(Categoria[].class)));
  }

  public Categoria buscaPorID(Integer id) {
    return webTarget.path("categoria/" + id)
        .request(MediaType.APPLICATION_JSON)
        .get(Categoria.class);
  }

  public boolean crear() {
    webTarget.path("categoria")
        .request(MediaType.APPLICATION_JSON)
        .get(Categoria.class);
    return true;
  }

  public boolean modificar() {
    webTarget.path("categoria")
        .request(MediaType.APPLICATION_JSON)
        .get(Categoria.class);
    return true;
  }

  public boolean borrar(Integer id) {
    webTarget.path("categoria/" + id)
        .request(MediaType.APPLICATION_JSON)
        .get(Categoria.class);
    return true;
  }

}
