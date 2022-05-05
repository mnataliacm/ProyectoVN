package edu.fpdual.proyectovn.jdbc.main;

import edu.fpdual.proyectovn.jdbc.connector.Connector;
import edu.fpdual.proyectovn.jdbc.controller.UsuarioController;
import edu.fpdual.proyectovn.jdbc.dao.Usuario;
import edu.fpdual.proyectovn.jdbc.manager.UsuarioManager;
import edu.fpdual.proyectovn.jdbc.manager.implement.CiudadManagerImpl;
import edu.fpdual.proyectovn.jdbc.manager.implement.UsuarioManagerImpl;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Main {
  public static void main(String[] args) throws SQLException, ClassNotFoundException {

    Connector connector = new Connector();
    Connection con = connector.getConnection();
    System.out.println(con.getCatalog());
    //UsuarioController usuarioController = new UsuarioController(new UsuarioManagerImpl());
    //System.out.println(usuarioController.todosUsuarios(connection));
    //System.out.println(new UsuarioManagerImpl().todosUsuarios(connection));
    ResultSet usuarios = new UsuarioManagerImpl().TodosUsuarios(con);

    System.out.println(usuarios);
    //System.out.println(usuarios.stream().findFirst());
    //System.out.println(usuarios.size());
    System.out.println(usuarios.toString());

    //System.out.println("Imprimo con bucle");
  //  int i = 0;
    //while (i < usuarios.size()) {
      ///for (Iterator it = usuarios.iterator(); it.hasNext(); ) {
       // String x = String.valueOf(((Iterator<?>) it).next());
       // System.out.println(x + " ");
     //   i++;

      //}
    //}

  }
}
