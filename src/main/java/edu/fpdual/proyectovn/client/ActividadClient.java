package edu.fpdual.proyectovn.client;

import edu.fpdual.proyectovn.client.dto.Actividad;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class ActividadClient {
  private final WebTarget webTarget;

  public ActividadClient() {
    Client client = ClientBuilder.newClient();
    this.webTarget = client.target("http://localhost:8081/WebServiceVN/api/");
  }

  public Set<Actividad> todos() {
    return new HashSet<>(Arrays.asList(webTarget.path("actividad")
        .request(MediaType.APPLICATION_JSON)
        .get(Actividad[].class)));
  }

  public Actividad crear(Actividad actividad) {
    return webTarget.path("actividad")
        .request(MediaType.APPLICATION_JSON)
        .post(Entity.entity(actividad, MediaType.APPLICATION_JSON), Actividad.class);
  }

  public Actividad modificar(Actividad actividad) {
    return webTarget.path("actividad")
        .request(MediaType.APPLICATION_JSON)
        .put(Entity.entity(actividad, MediaType.APPLICATION_JSON), Actividad.class);
  }

  public boolean borrar(Integer id) {
    webTarget.path("actividad/" + id)
        .request(MediaType.APPLICATION_JSON)
        .delete(Actividad.class);
    return true;
  }
  public Actividad buscaPorID(Integer id) {
    return webTarget.path("actividad/" + id)
            .request(MediaType.APPLICATION_JSON)
            .get(Actividad.class);
  }

}
