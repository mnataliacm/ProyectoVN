package edu.fpdual.proyectovn.jdbc.main;

import edu.fpdual.proyectovn.jdbc.connector.Connector;
import edu.fpdual.proyectovn.jdbc.controller.UsuarioController;
import edu.fpdual.proyectovn.jdbc.manager.UsuarioManager;
import edu.fpdual.proyectovn.jdbc.manager.implement.UsuarioManagerImpl;

import java.sql.Connection;
import java.sql.SQLException;

public class Main {
  public static void main(String[] args) throws SQLException, ClassNotFoundException {

    Connector connector = new Connector();
    Connection connection = connector.getConnection();
    System.out.println(connection.getCatalog());
    //UsuarioController usuarioController = new UsuarioController(new UsuarioManagerImpl());
    //System.out.println(usuarioController.todosUsuarios(connection));
    System.out.println(new UsuarioManagerImpl().todosUsuarios(connection));



  }
}

