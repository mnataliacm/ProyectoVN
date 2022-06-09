package edu.fpdual.proyectovn.client;

import edu.fpdual.proyectovn.client.dto.Empresa;
import edu.fpdual.proyectovn.client.dto.Usuario;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import static jakarta.ws.rs.client.ClientBuilder.newClient;

public class EmpresaClient {
    private final WebTarget webTarget;

    public EmpresaClient() {
        Client client = newClient();
        this.webTarget = client.target("http://localhost:8081/WebServiceVN/api/");
    }

    public Set<Empresa> todos() {
        return new HashSet<>(Arrays.asList(webTarget.path("empresa")
                .request(MediaType.APPLICATION_JSON)
                .get(Empresa[].class)));
    }

    public boolean crear() {
        webTarget.path("empresa")
                .request(MediaType.APPLICATION_JSON)
                .get(Empresa.class);
        return true;
    }

    public boolean modificar() {
        webTarget.path("empresa")
                .request(MediaType.APPLICATION_JSON)
                .get(Empresa.class);
        return true;
    }

    public boolean borrar(Integer idemp) {
        webTarget.path("empresa/" + idemp)
                .request(MediaType.APPLICATION_JSON)
                .get(Usuario.class);
        return true;
    }
}
// TODO: 08/06/2022 Pendiente de arreglar
