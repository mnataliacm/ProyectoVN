package edu.fpdual.proyectovn.client;

import edu.fpdual.proyectovn.client.dto.Empresa;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import static jakarta.ws.rs.client.ClientBuilder.newClient;

public class EmpresaClient {
    private final WebTarget webTarget;

    public EmpresaClient() {
        Client client = ClientBuilder.newClient();
        this.webTarget = client.target("http://localhost:8081/WebServiceVN/api/");
    }

    public Set<Empresa> todos() {
        return new HashSet<>(Arrays.asList(webTarget.path("empresa")
                .request(MediaType.APPLICATION_JSON)
                .get(Empresa[].class)));
    }

    public Empresa crear(Empresa empresa) {
        return webTarget.path("empresa")
                .request(MediaType.APPLICATION_JSON)
                .post(Entity.entity(empresa, MediaType.APPLICATION_JSON), Empresa.class);
    }

    public Empresa modificar(Empresa empresa) {
        return webTarget.path("empresa")
                .request(MediaType.APPLICATION_JSON)
                .put(Entity.entity(empresa, MediaType.APPLICATION_JSON), Empresa.class);
    }

    public boolean borrar(Integer id) {
        webTarget.path("empresa/" + id)
                .request(MediaType.APPLICATION_JSON)
                .delete(Empresa.class);
        return true;
    }
}

