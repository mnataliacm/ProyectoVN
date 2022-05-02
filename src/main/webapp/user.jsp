<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="edu.fpdual.proyectovn.jdbc.connector.Connector" %>
<%@ page import="edu.fpdual.proyectovn.jdbc.manager.implement.UsuarioManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.jdbc.dao.Usuario" %>
<%@ page import="edu.fpdual.proyectovn.jdbc.manager.UsuarioManager" %>
<%@ page import="java.util.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Natalia
  Date: 30/04/2022
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Gestión Usuarios</title>
  <link rel="shortcut icon" href="./imagenes/iconoflor.png" type="image/x-icon">
  <!-- CSS bootstrap -->
  <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous">
  <!-- ICONOS bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
  <!-- CSS mio -->
  <link rel="stylesheet" href="./estilo/style.css">
  <!-- javascript para reutilizar navbar -->
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body class="bg-success">
<div id="wraper" class="container-flex">
  <!--Barra navegacion-->
  <div id="nav-placeholder"></div>

  <%-- enlace con la base de datos --%>
    <%--
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/proyectovn","root", "root");
    Statement s = con.createStatement();

    ResultSet listado = s.executeQuery("SELECT * FROM usuario");
  --%>
  <%
    Connector connector = new Connector();
    Connection con = connector.getConnection();
    ResultSet usuarios = new UsuarioManagerImpl().todosUsuarios(con);
  %>

  <!-- listado de plantas     table-responsive-stack table  table-success table-striped -->
  <div class="container mt-3 text-center">
    <div class=" panel panel-light">
      <h2 class="panel-heading text-center bg-verde">BASE DE DATOS DE USUARIOS</h2>
      <table class="table table-striped table-verde ">
        <tr class="table-dark"><td></td><th>Usuario</th><th>Contraseña</th><th>Email</th><th>Ciudad</th>

        <%
          while (usuarios.next()) {
        %>
        <tr>
          <td><%=usuarios.getInt("IDusu")%></td>
          <td><%=usuarios.getString("NomUsu")%></td>
          <td><%=usuarios.getString("ApeUsu")%></td>
          <td><%=usuarios.getString("Email")%></td>
          <td><%=usuarios.getString("IDciu")%></td>
        %>
<%
               }
  con.close();
%>

  </table>
  </div>
  </div>
</body>
</html>
