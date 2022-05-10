<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="edu.fpdual.proyectovn.jdbc.connector.Connector" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="edu.fpdual.proyectovn.jdbc.manager.implement.UsuarioManagerImpl" %>

<%--
    Author     : Natalia Castillo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Gestión Usuarios</title>
  <link rel="shortcut icon" href="images/icons/logo.ico" type="image/x-icon">
  <!-- CSS bootstrap -->
  <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous">
  <!-- ICONOS bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
  <!-- CSS mio -->
  <link rel="stylesheet" href="./style/style.css">
  <!-- javascript para reutilizar navbar -->
  <script src="https://code.jquery.com/jquery.min.js"></script>
</head>
<body>
<div id="wrapper" class="container-flex">
  <!--Barra navegacion-->
  <div id="nav-placeholder"></div>
  <%-- enlace con la base de datos --%>
  <%// TODO: 01/05/2022 añadir control login que solo admin pueda ver e intentar conectar con JDBC
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectovn","root", "Proyecto.VN");
    request.setCharacterEncoding("UTF-8");
    Statement s = con.createStatement();

    ResultSet listado = s.executeQuery("SELECT * FROM empresa");
  %>
  <%--
    Connector connector = new Connector();
    Connection con = connector.getConnection();
    ResultSet listado = new UsuarioManagerImpl().TodosUsuarios(con);

  --%>


  <!-- listado de plantas     table-responsive-stack table  table-success table-striped -->
  <div class="container mt-3 text-center">
    <div class=" panel panel-light">
      <h2 class="panel-heading text-center bg-verde">BASE DE DATOS DE EMPRESAS</h2>
      <table class="table table-striped table-verde ">
        <tr class="table-dark"><th>ID</th><th>Empresa</th><th>Ciudad</th></tr>
          <%
             while (listado.next()) {
        %>
        <tr>
          <td><%=listado.getInt("IDemp")%></td>
          <td><%=listado.getString("NomEmp")%></td>
          <td><%=listado.getString("IDciu")%></td>
          <!-- modificar -->
          <td>
            <div class="row">
              <div class="col-4 ">
                <form method="post" action="user.jsp">
                  <input type="hidden" name="NomEmp" value="<%=listado.getString("NomEmp") %>">
                  <input type="hidden" name="IDciu" value="<%=listado.getString("IDciu") %>">
                  <button type="submit"  class="btn btn-info"><span class="bi bi-pencil-fill"> </span> Editar</button>
                </form>
              </div>
              <%--borrar--%>
              <div class="col-4">
                <form method="post" action="index.jsp">
                  <input type="hidden" name="IDemp" value="<%=listado.getString("IDemp") %>"/>
                  <button type="submit" class="btn btn-danger"><span class="bi bi-trash-fill"></span> Borrar</button>
                </form>
              </div>
            </div>
          </td>
        </tr>
        <%
          }
          con.close();
        %>
      </table>
    </div>
  </div> <!-- cierre container lista -->
</div> <!-- fin wrapper -->
<!-- JS bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!-- JS mio -->
<script src="javascript/javascript.js"></script>
</body>
</html>
