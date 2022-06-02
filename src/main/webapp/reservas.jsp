<%@ page import="edu.fpdual.proyectovn.model.manager.implement.EmpresaManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.controller.EmpresaController" %>
<%@ page import="edu.fpdual.proyectovn.model.dao.Empresa" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="edu.fpdual.proyectovn.controller.ReservaController" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.implement.ReservasManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.model.dao.Reservas" %>

<%--
    Author     : Natalia Castillo
    Author     : Verónica González
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Gestión Usuarios</title>
    <link rel="shortcut icon" href="images/icons/favicon2.ico" type="image/x-icon">
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

    <%int total=0;
     ReservaController reservaController = new ReservaController( new ReservasManagerImpl());%>

    <!-- listado de plantas     table-responsive-stack table  table-success table-striped -->
    <div class="container mt-3 text-center">
        <div class="panel panel-light">
            <h2 class="panel-heading text-center bg-verde">BASE DE DATOS DE RESRVAS (<%=total %>)</h2>


            <table class="table table-striped table-verde ">
                <tr class="table-dark">
                    <th>ID</th>
                    <th>Actividad</th>
                    <th>Usuario</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                </tr>

                <%
                    for (Reservas e : reservaController.todasReservas()) {
                %>
                <tr>
                    <td><%=e.getIdres()%>
                    </td>
                    <td><%=e.getIdAct()%>
                    </td>
                    <td><%=e.getIdUsu()%>
                    </td>
                    <td><%=e.getFecha()%>
                    </td>
                    <td><%=e.getHora()%>
                    </td>
                    <!-- modificar -->
                    <td>
                        <div class="row">
                            <div class="col-4 ">
                                <form method="post" action="reservas.jsp">
                                    <input type="hidden" name="IDres" value="<%=e.getIdres()%>">
                                    <input type="hidden" name="IDusu" value="<%=e.getIdUsu()%>">
                                    <input type="hidden" name="IDact" value="<%=e.getIdAct()%>">
                                    <input type="hidden" name="Fecha" value="<%=e.getFecha()%>">
                                    <input type="hidden" name="Hora" value="<%=e.getHora()%>">
                                    <button type="submit" class="btn btn-info"><span class="bi bi-pencil-fill"> </span> Editar</button>
                                </form>
                            </div>
                            <%--borrar--%>
                            <div class="col-4">
                                <form method="post" action="reservas.jsp">
                                    <input type="hidden" name="IDres" value="<%=e.getIdres()%>"/>
                                    <button type="submit" class="btn btn-danger"><span class="bi bi-trash-fill"></span> Borrar</button>
                                </form>
                            </div>
                        </div>
                    </td>
                </tr>
                <%
                    }

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
