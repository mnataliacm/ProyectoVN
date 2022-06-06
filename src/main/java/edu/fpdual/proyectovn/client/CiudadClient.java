package edu.fpdual.proyectovn.client;

import edu.fpdual.proyectovn.client.dto.Ciudad;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class CiudadClient {
  private final WebTarget webTarget;

  public CiudadClient() {
    Client client = ClientBuilder.newClient();
    this.webTarget = client.target("http://localhost:8081/WebServiceVN/api/");
  }

  public Set<Ciudad> todos() {
    return new HashSet<Ciudad>(Arrays.asList(webTarget.path("ciudad")
        .request(MediaType.APPLICATION_JSON)
        .get(Ciudad[].class)));
  }
  public String buscaPorID(Integer id) {
    return webTarget.path("ciudad/" + id)
        .request(MediaType.APPLICATION_JSON)
        .get(Ciudad.class).getNom();
  }

  public boolean crear(Ciudad ciudad) {
    webTarget.path("ciudad")
        .request(MediaType.APPLICATION_JSON)
        .get(Ciudad.class);
    return true;
  }

  public boolean modificar(Ciudad ciudad) {
    webTarget.path("ciudad")
        .request(MediaType.APPLICATION_JSON)
        .get(Ciudad.class);
    return true;
  }

  public boolean borrar(Integer id) {
    webTarget.path("ciudad/" + id)
        .request(MediaType.APPLICATION_JSON)
        .get(Ciudad.class);
    return true;
  }
}
