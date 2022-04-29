package edu.fpdual.proyectovn.jdbc.connector;

import lombok.Getter;
import lombok.Setter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
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
   * Creates the connection object for a MySQL DDBB
   * @return a {@link Connection}
   * @throws ClassNotFoundException
   * @throws SQLException
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
   * Obtains the URL to connect to a MySQL DDBB.
   * @return an URL
   */
  private String getURL() {
    //jdbc:mysql://localhost:3306/world?user=sa&password=12345678&useSSL=false;
    return new StringBuilder().append(prop.getProperty(Constants.URL_PREFIX))
        .append(prop.getProperty(Constants.URL_HOST)).append(":")
        .append(prop.getProperty(Constants.URL_PORT)).append("/")
        .append(prop.getProperty(Constants.URL_SCHEMA)).append("?user=")
        .append(prop.getProperty(Constants.USER)).append("&password=")
        .append(prop.getProperty(Constants.PASSWD)).append("&useSSL=")
        .append(prop.getProperty(Constants.URL_SSL)).append(("&allowPublicKeyRetrieval="))
        .append(prop.getProperty(Constants.ALLOW_PUBLIC_KEY_RETRIEVAL)).append(("&useJDBCCompliantTimezoneShift="))
        .append(prop.getProperty(Constants.USE_JDBC_COMPLIANT_TIMEZONE_SHIFT)).append(("&useLegacyDatetimeCode="))
        .append(prop.getProperty(Constants.USE_LEGACY_DATE_TIME_CODE)).append(("&serverTimezone="))
        .append(prop.getProperty(Constants.SERVER_TIMEZONE)).toString();
  }
}
