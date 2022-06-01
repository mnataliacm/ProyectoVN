package edu.fpdual.proyectovn.model.connector;

import lombok.Getter;
import lombok.Setter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Crea la conexión con la BBDD
 *
 * @author Natalia Castillo Muñoz
 * @author Verónica González Pons
 */
public class Connector {

  @Setter
  @Getter
  Properties prop = new Properties();

  public Connector() {
    try {
      //Loads all the properties of file "config.properties".
      prop.load(getClass().getClassLoader().getResourceAsStream("config.properties"));
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  /**
   * Crea el objeto de conexión para MySQL BBDD
   * @return a {@link Connection}
   */
  public Connection getConnection() throws ClassNotFoundException, SQLException {
    try {

      //Indicates which driver is going to be used.
      Class.forName(prop.getProperty(Constants.DRIVER));

      //Creates the connection based on the obtained URL.
      return  DriverManager.getConnection(getURL());

    } catch (ClassNotFoundException | SQLException e) {
      e.printStackTrace();
      throw e;
    }
  }

  /**
   * Obtiene la URL para conectar con MySQL BBDD.
   * @return una URL
   */
  private String getURL() {
    //jdbc:mysql://localhost:3306/world?user=sa&password=12345678&useSSL=false;
    return prop.getProperty(Constants.URL_PREFIX) +
        prop.getProperty(Constants.URL_HOST) + ":" +
        prop.getProperty(Constants.URL_PORT) + "/" +
        prop.getProperty(Constants.URL_SCHEMA) + "?user=" +
        prop.getProperty(Constants.USER) + "&password=" +
        prop.getProperty(Constants.PASSWD) + "&useSSL=" +
        prop.getProperty(Constants.URL_SSL) + ("&allowPublicKeyRetrieval=") +
        prop.getProperty(Constants.ALLOW_PUBLIC_KEY_RETRIEVAL) + ("&useJDBCCompliantTimezoneShift=") +
        prop.getProperty(Constants.USE_JDBC_COMPLIANT_TIMEZONE_SHIFT) + ("&useLegacyDatetimeCode=") +
        prop.getProperty(Constants.USE_LEGACY_DATE_TIME_CODE) + ("&serverTimezone=") +
        prop.getProperty(Constants.SERVER_TIMEZONE);
  }
}
