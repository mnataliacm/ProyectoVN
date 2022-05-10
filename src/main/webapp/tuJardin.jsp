<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Author     : Natalia Castillo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Tu Jardín</title>
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
    <div id="wraper" class="container-flex text-center">
      <!--Barra navegacion-->
      <div id="nav-placeholder"></div>
      <%-- enlace con la base de datos --%>
      <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mijardin","root", "");        
        Statement n = conexion.createStatement();  
        
        int codigo = (int) session.getAttribute("codigo");
        
        String nombre = (String) session.getAttribute("usuario");
        String user = nombre.toUpperCase().charAt(0) + nombre.substring(1, nombre.length()).toLowerCase();
        int conteo = 0;

        ResultSet jardin = n.executeQuery("SELECT p.nombre, p.cientifico, f.familia, j.codpla, p.info"
              + " FROM familia f "
              + " INNER JOIN planta p ON f.codfam = p.familia"
              + " INNER JOIN jardin j ON p.codpla = j.codpla"
              + " INNER JOIN usuarios u ON u.codusu = j.codusu"
              + " WHERE u.usuario LIKE '" + session.getAttribute("usuario") + "'");
        
      %>
      <!-- listado de plantas del jardin del usuario-->
      <div class="container-flex m-3">
        <div class=" panel">
          <h2 class="panel-heading text-center bg-turquesa">Jardín de <%=user %></h2>  
        </div>      
        <div class="container-flex text-center">
          <table>
            <div class="row row-cols-1 row-cols-md-4 g-4">
              <% 
                String planta = request.getParameter("j.codpla");
                while (jardin.next()) {
                  conteo++;                  
              %>         
              <div class="col">                 
                <div class="card">             
                  <div class="card-header">
                    <div class="modal-header">
                      <h4><%=jardin.getString("p.nombre") %></h4>
                      <form method="post" action="borraDeJardin.jsp">
                        <input type="hidden" name="codpla" value="<%=jardin.getString("codpla") %>">
                        <button type="submit" class="btn btn-close"></button>
                      </form>
                    </div>
                  </div>
                  <div class="card-body">
                    <h6 class="card-title"><%=jardin.getString("p.cientifico") %></h6>
                    <img src="" class="card-img-top">
                    <p class="card-text">
                      <%=jardin.getString("info")%>);
                    </p>
                  </div>
                  <div class="card-footer">
                    <h5><%=jardin.getString("f.familia") %></h5>
                  </div>          
                </div>
              </div>               
              <%    
              }
              session.setAttribute("conteo", conteo);
              %>             
            </div>      <!-- fin row -->
          </table>
        </div> <!-- cierre container lista -->
      </div>
    </div> <!-- fin wraper --> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
    <script src="./js/javascript.js"></script>
  </body>
</html>