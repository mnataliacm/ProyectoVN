package edu.fpdual.proyectovn.client;

import edu.fpdual.proyectovn.client.dto.Usuario;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class UsuarioClient {
  private final WebTarget webTarget;

  public UsuarioClient() {
    Client client = ClientBuilder.newClient();
    this.webTarget = client.target("http://localhost:8081/WebServiceVN/api/");
  }

  public Set<Usuario> getTodos() {
    return new HashSet<Usuario>(Arrays.asList(webTarget.path("usuario")
        .request(MediaType.APPLICATION_JSON)
        .get(Usuario[].class)));
  }

  public Usuario getUsuario(Integer id) {
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
