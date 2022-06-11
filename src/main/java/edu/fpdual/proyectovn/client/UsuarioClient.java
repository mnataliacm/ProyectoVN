package edu.fpdual.proyectovn.client;

import edu.fpdual.proyectovn.client.dto.Usuario;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.Entity;
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

  public Usuario buscaPorNombre(String nom) {
    return webTarget.path("usuario/login/" + nom)
        .request(MediaType.APPLICATION_JSON)
        .get(Usuario.class);
  }

  public Usuario crear(Usuario usuario) {
   return webTarget.path("usuario")
        .request(MediaType.APPLICATION_JSON)
        .post(Entity.entity(usuario, MediaType.APPLICATION_JSON), Usuario.class);
  }

  public Usuario modificar(Usuario usuario) {
    return webTarget.path("usuario")
        .request(MediaType.APPLICATION_JSON)
        .put(Entity.entity(usuario, MediaType.APPLICATION_JSON), Usuario.class);
  }

  public boolean borrar(Integer id) {
    webTarget.path("usuario/" + id)
        .request(MediaType.APPLICATION_JSON)
        .delete(Usuario.class);
    return true;
  }

  public void enviarEmail(Integer id) {
    webTarget.path("usuario/email/" + id)
        .request(MediaType.APPLICATION_JSON)
        .get();
  }
}
