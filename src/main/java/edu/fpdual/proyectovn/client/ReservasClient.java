package edu.fpdual.proyectovn.client;

import edu.fpdual.proyectovn.client.dto.Actividad;
import edu.fpdual.proyectovn.client.dto.Empresa;
import edu.fpdual.proyectovn.client.dto.Reservas;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import static jakarta.ws.rs.client.ClientBuilder.newClient;

public class ReservasClient {
    private final WebTarget webTarget;

    public ReservasClient() {
        Client client = ClientBuilder.newClient();
        this.webTarget = client.target("http://localhost:8081/WebServiceVN/api/");
    }

    public Set<Reservas> todos() {
        return new HashSet<>(Arrays.asList(webTarget.path("reserva")
                .request(MediaType.APPLICATION_JSON)
                .get(Reservas[].class)));
    }

    public Reservas crear(Reservas reservas) {
        return webTarget.path("reserva")
                .request(MediaType.APPLICATION_JSON)
                .post(Entity.entity(reservas, MediaType.APPLICATION_JSON), Reservas.class);
    }

    public Reservas modificar(Reservas reservas) {
        return webTarget.path("reserva")
                .request(MediaType.APPLICATION_JSON)
                .put(Entity.entity(reservas, MediaType.APPLICATION_JSON), Reservas.class);
    }

    public boolean borrar(Integer id) {
        webTarget.path("reserva/" + id)
                .request(MediaType.APPLICATION_JSON)
                .delete(Reservas.class);
        return true;
    }
}

