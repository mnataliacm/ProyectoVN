package edu.fpdual.proyectovn;

import edu.fpdual.proyectovn.client.UsuarioClient;

public class Main {

  public static void main(String[] args) {

    //System.out.println(new UsuarioClient().todos().size());
    //System.out.println(new UsuarioClient().todos());
    System.out.println(new UsuarioClient().buscaPorID(Integer.valueOf(3)));

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
