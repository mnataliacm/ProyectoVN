package edu.fpdual.proyectovn.jdbc.main;

import edu.fpdual.proyectovn.jdbc.connector.Connector;
import edu.fpdual.proyectovn.jdbc.dao.Usuario;
import edu.fpdual.proyectovn.jdbc.manager.implement.UsuarioManagerImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedList;


public class Main {
  public static void main(String[] args) throws SQLException, ClassNotFoundException {

    Connector connector = new Connector();
    Connection con = connector.getConnection();
    System.out.println(con.getCatalog());

    LinkedList<Usuario> listado = new UsuarioManagerImpl().TodosUsuarios();
    for (int i = 0; i < listado.size(); i++) {
      System.out.println(listado.get(i).getId());
      System.out.println(listado.get(i).getNom());
    }


  }
}
