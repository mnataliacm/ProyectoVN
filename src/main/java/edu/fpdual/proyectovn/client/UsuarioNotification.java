package edu.fpdual.proyectovn.client;

import edu.fpdual.proyectovn.client.dto.Notification;
import edu.fpdual.proyectovn.model.dao.Usuario;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;

public class UsuarioNotification {
  private final WebTarget webTarget;

  public UsuarioNotification() {
    Client client = ClientBuilder.newClient();
    this.webTarget = client.target("http://localhost:8081/WebServiceVN/api/");
  }

  public Usuario getUsuario() {

    return webTarget.path("usuario")
        .request(MediaType.APPLICATION_JSON)
        .get(Usuario.class);
  }

  public Usuario getUsuario(String id) {

    return webTarget.path("usuario/" + id)
        .request(MediaType.APPLICATION_JSON)
        .get(Usuario.class);
  }
}
