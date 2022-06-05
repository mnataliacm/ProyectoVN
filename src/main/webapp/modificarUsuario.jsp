<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%--
    Author     : Natalia Castillo
--%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Modificar Usuarios</title>
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
    <link rel="stylesheet" href="style/style.css">
    <!-- javascript para reutilizar navbar -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
  </head>
  <body>
    <div id="wraper" class="container-flex vh-100 p-5 m-5">
      <div class="container m-auto">
        <div class="row m-auto">
          <div class="col p-3">
            <div class="card bg-verde">
              <div class="card-header text-center">
                <img src="images/cenefaVerde.png" class="img w-50" alt="tulipanes rojos">
                <h2 class="bg-tostado text-center py-3">Editar usuario</h2>
              </div>
              <form method="post" action="grabarUserModificado.jsp">
                <div class="card-body bg-naranja">
                  <div class="row">
                    <div class="col">
                      <label>ID <input type="text" size="5" name="IDusu" value="<%= request.getParameter("IDusu") %>" readonly></label>
                    </div>
                    <div class="col"> 
                      <label>Nombre <input type="text" size="25" name="NomUsu" value="<%= request.getParameter("NomUsu") %>" required></label>
                    </div>
                    <div class="col"> 
                      <label>Apellido <input type="text" size="25" name="ApeUsu" value="<%= request.getParameter("ApeUsu") %>" required ></label>
                    </div>           
                    <div class="col"> 
                      <label>Contraseña <input type="text" size="25" name="PassUsu" value="<%= request.getParameter("PassUsu") %>" required ></label>
                    </div>
                    <div class="col">
                      <label>Email <input type="email" size="35" name="Email" value="<%= request.getParameter("Email") %>" required ></label>
                    </div>
                    <div class="col">
                      <label>Móvil <input type="text" size="35" name="Movil" value="<%= request.getParameter("Movil") %>" required ></label>
                    </div>
                    <div class="col">
                      <label>Ciudad <input type="text" size="25" name="Ciudad" value="<%= request.getParameter("Ciudad") %>" required ></label>
                    </div>
                  </div>
                </div>
                <div class="card-footer text-center">
                  <div class="row">
                    <div class="col">
                      <button type="submit" class="btn btn-success"><span class="bi bi-person-plus"></span>  Cambiar</button>
                    </div>
                    <div class="col">
                      <a href="usuarios.jsp" class="btn btn-danger"><span class="bi bi-person-x"></span>  Cancelar</a> 
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
    <!-- JS mio -->
    <script src="javascript/javascript.js"></script>
  </body>
</html>
