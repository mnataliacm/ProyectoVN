package edu.fpdual.proyectovn.client;

import edu.fpdual.proyectovn.client.dto.Actividad;
import edu.fpdual.proyectovn.client.dto.Usuario;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
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
    return new HashSet<Actividad>(Arrays.asList(webTarget.path("actividad")
        .request(MediaType.APPLICATION_JSON)
        .get(Actividad[].class)));
  }
  public Actividad buscaPorID(Integer id) {
    return webTarget.path("actividad/" + id)
        .request(MediaType.APPLICATION_JSON)
        .get(Actividad.class);
  }

  public boolean crear(Actividad actividad) {
    webTarget.path("actividad")
        .request(MediaType.APPLICATION_JSON)
        .get(Actividad.class);
    return true;
  }

  public boolean modificar(Actividad actividad) {
    webTarget.path("actividad")
        .request(MediaType.APPLICATION_JSON)
        .get(Actividad.class);
    return true;
  }

  public boolean borrar(Integer id) {
    webTarget.path("actividad/" + id)
        .request(MediaType.APPLICATION_JSON)
        .get(Actividad.class);
    return true;
  }
}
