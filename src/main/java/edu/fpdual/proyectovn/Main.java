package edu.fpdual.proyectovn;

import edu.fpdual.proyectovn.client.*;
import edu.fpdual.proyectovn.client.dto.Actividad;
import edu.fpdual.proyectovn.client.dto.Usuario;

public class Main {

  public static void main(String[] args) {
    Usuario usuario = new Usuario("tata", "tata", "tata", "tata@email.com", "123", 4);
    Actividad actividad = new Actividad(4, 4, "tacatate", 1, "", "");
    System.out.println(new UsuarioClient().todos().size());
    //System.out.println(new UsuarioClient().todos());
    //System.out.println(new UsuarioClient().crear(usuario));
    System.out.println(new ActividadClient().todos().size());
    //System.out.println(new ActividadClient().crear(actividad));
    System.out.println(new EmpresaClient().todos());
    System.out.println(new CiudadClient().buscaPorID(23));
    usuario = new UsuarioClient().buscaPorID(45);
    System.out.println(usuario);

    System.out.println(new UsuarioClient().borrar(45));

    System.out.println(new ActividadClient().modificar(actividad));
    /*
    Connector connector = new Connector();
    Connection con = connector.getConnection();
    System.out.println(con.getCatalog());
*/
    /*UsuarioController usuarioController = new UsuarioController(new UsuarioManagerImpl());
    System.out.println(usuarioController.todosUsuarios().size());
    System.out.println(usuarioController.todosUsuarios() + "\n");
    //UsuarioService usuarioService = new UsuarioService((List<Usuario>) usuarioController);
    //System.out.println(usuarioService.todosUsuarios().size());
    //System.out.println(usuarioController.todosUsuarios());
    EmpresaController empresaController = new EmpresaController(new EmpresaManagerImpl());
    System.out.println(empresaController.todasEmpresas().size());
    System.out.println(empresaController.todasEmpresas());*/


 /*   // Crea una instancia de la clase MessageDigest para manejar los
// métodos de encriptación.
    MessageDigest md = MessageDigest.getInstance("MD5");
// Actualiza la instancia con la cadena que queremos encriptar
    md.update("latarara".getBytes());
    // Crea el hash a partir de la cadena
    String hash = DatatypeConverter.printHexBinary(md.digest());
// Muestra por pantalla el hash
    System.out.print("A la cadena \"latarara\" le corresponde el hash: " + hash + "<br>");
// Comprueba si la clave es correcta
    System.out.print(
        MessageDigest.isEqual(hash.getBytes(), "26056A29E1E3A2E813EE5575A774B9B0".getBytes())
    );
*/


    /*System.out.println(new NotificationClient().getNotification("8"));
    System.out.println(new NotificationClient().getNotification("82", ":D"));
    System.out.println(new NotificationClient().putNotification("82", ":D"));
    System.out.println(new NotificationClient().postNotification(
        Notification.builder().id(9).body("Prueba de consumo de servicio").title("Prueba").build()));*/
  }

}
