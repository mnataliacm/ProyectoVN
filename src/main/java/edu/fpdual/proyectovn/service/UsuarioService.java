package edu.fpdual.proyectovn.service;

import edu.fpdual.proyectovn.client.UsuarioClient;
import edu.fpdual.proyectovn.client.dto.Usuario;

import java.util.Set;

public class UsuarioService {
  private final UsuarioClient usuarioClient;

  public UsuarioService() {
    this.usuarioClient = new UsuarioClient();
  }
  public Set<Usuario> todosUsuarios() {
      return usuarioClient.getTodos();
}
  public Usuario buscaIdUsuario(Integer id) {
      return usuarioClient.getUsuario(id);
  }
  public boolean crearUsuario(Usuario usuario) {
    return usuarioClient.crear(usuario);
  }
  public boolean modificarUsuario(Usuario usuario) {
      return usuarioClient.modificar(usuario);
  }
  public boolean borrarUsuario(Integer id) {
      return usuarioClient.borrar(id);
  }

}
