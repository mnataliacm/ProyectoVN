package edu.fpdual.proyectovn.client;

import edu.fpdual.proyectovn.client.dto.Usuario;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import static jakarta.ws.rs.client.ClientBuilder.newClient;

public class UsuarioClient {
  private final WebTarget webTarget;

  public UsuarioClient() {
    Client client = newClient();
    this.webTarget = client.target("http://localhost:8081/WebServiceVN/api/");
  }

  public Set<Usuario> todos() {
    return new HashSet<>(Arrays.asList(webTarget.path("usuario")
        .request(MediaType.APPLICATION_JSON)
        .get(Usuario[].class)));
  }

  public Usuario buscaPorID(Integer id) {
    return webTarget.path("usuario/" + id)
        .request(MediaType.APPLICATION_JSON)
        .get(Usuario.class);
  }

  public boolean crear(Usuario usuario) {
    webTarget.path("usuario")
        .request(MediaType.APPLICATION_JSON)
        .get(Usuario.class);
    return true;
  }

  public boolean modificar(Usuario usuario) {
    webTarget.path("usuario")
        .request(MediaType.APPLICATION_JSON)
        .get(Usuario.class);
    return true;
  }

  public boolean borrar(Integer id) {
    webTarget.path("usuario/" + id)
        .request(MediaType.APPLICATION_JSON)
        .get(Usuario.class);
    return true;
  }
}
