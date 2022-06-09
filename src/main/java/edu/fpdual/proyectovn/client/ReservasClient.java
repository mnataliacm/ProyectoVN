package edu.fpdual.proyectovn.client;

import edu.fpdual.proyectovn.client.dto.Reservas;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import static jakarta.ws.rs.client.ClientBuilder.newClient;

public class ReservasClient {
    private final WebTarget webTarget;

    public ReservasClient() {
        Client client = newClient();
        this.webTarget = client.target("http://localhost:8081/WebServiceVN/api/");
    }

    public Set<Reservas> todos() {
        return new HashSet<>(Arrays.asList(webTarget.path("reserva")
                .request(MediaType.APPLICATION_JSON)
                .get(Reservas[].class)));
    }

    public boolean crear() {
        webTarget.path("reserva")
                .request(MediaType.APPLICATION_JSON)
                .get(Reservas.class);
        return true;
    }

    public boolean modificar() {
        webTarget.path("reserva")
                .request(MediaType.APPLICATION_JSON)
                .get(Reservas.class);
        return true;
    }

    public boolean borrar(Integer idres) {
        webTarget.path("reserva/" + idres)
                .request(MediaType.APPLICATION_JSON)
                .get(Reservas.class);
        return true;
    }
}
// TODO: 08/06/2022 Pendiente de arreglar
