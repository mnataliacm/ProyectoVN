<%--
  Created by IntelliJ IDEA.
  User: Veronica G.P
  Date: 20/05/2022
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Modificar Empresa</title>
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
<body>
<div id="wraper" class="container-flex vh-100 p-5 m-5">
    <div class="container m-auto">
        <div class="row m-auto">
            <div class="col p-3">
                <div class="card bg-verde">
                    <div class="card-header text-center">
                        <img src="./imagnes2/icoEmp.png" class="img w-50" alt="tulipanes rojos">
                        <h2 class="bg-tostado text-center py-3">Editar Empresa</h2>
                    </div>
                    <form method="post" action="grabarEmpModificada.jsp">
                        <div class="card-body bg-naranja">
                            <div class="row">
                                <div class="col">
                                    <label>Empresa:</label><input type="text" size="35" name="NomEmp" value="<%= request.getParameter("NomEmp") %>" required>
                                </div>
                                <div class="col">
                                    <label>Ciudad</label><input type="text" size="35" name="IDciu" value="<%= request.getParameter("IDciu") %>" required >
                                </div>
                            </div>
                        </div>
                        <div class="card-footer text-center">
                            <div class="row">
                                <div class="col">
                                    <button type="submit" class="btn btn-success"><span class="bi bi-person-plus"></span>  Cambiar</button>
                                </div>
                                <div class="col">
                                    <a href="empresas.jsp" class="btn btn-danger"><span class="bi bi-person-x"></span>  Cancelar</a>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div> <!-- fin row -->
    </div> <!-- fin container -->
</div><!-- fin wraper -->

<!-- JS bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!-- JS materialize
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
-->
<!-- JS mio -->
<script src="./js/javascript.js"></script>
</body>
</html>
