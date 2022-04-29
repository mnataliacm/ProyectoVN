package edu.fpdual.proyectovn.jdbc.main;

import edu.fpdual.proyectovn.jdbc.connector.Connector;

import java.sql.Connection;
import java.sql.SQLException;

public class Main {
  public static void main(String[] args) throws SQLException, ClassNotFoundException {

    Connector connector = new Connector();
    Connection connection = connector.getConnection();
    System.out.println(connection.getCatalog());

  }
}

