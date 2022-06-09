<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%--
    Author     : Natalia Castillo
    Author     : Veronica Gonzalez
--%>
<nav class="navbar navbar-expand-md navbar-light bg-naranja sticky-top justify-content-between">
  <div class="container-fluid fs-5">
    <a class="navbar-brand" href="index.jsp"><i
        class="bi bi-flower1" aria-hidden="true"></i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <!-- sin registro -->
        <% // TODO: 01/05/2022 intentar reducir código con if y variables
         String user = (String) session.getAttribute("usuario");
         if (session.getAttribute("usuario") == null) {
        %>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="formularioRegistro.jsp">Crear cuenta</a>
        </li>
          <li class="nav-item">
            <a class="nav-link active" href="ciudades.jsp">Ciudades</a>
          </li>
        <li class="nav-item">
          <a class="nav-link active" href="actividades.jsp">Actividades</a>
        </li>
        </ul>
      <form class="form-inline">
         <a class="btn-lg btn-turquesa text-white p-2" href="formularioLogin.jsp">Iniciar sesión</a>
      </form>
      <!-- Administrador -->
        <%
          } else if ((session.getAttribute("usuario") != null) && (user.equals("Admin"))) {
        %>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" href="usuarios.jsp">Usuarios</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="empresas.jsp">Empresas</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="actividades.jsp">Actividades</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="reservas.jsp">Reservas</a>
          </li>
        </ul>
        <form class="form-inline">
         <pre>Bienvenid@, <strong><%=session.getAttribute("usuario") %></strong>. (<a href="logout.jsp">Salir</a>)</pre>
      </form>
      <!-- Usuario -->
        <%
        } else if (session.getAttribute("usuario") != null) {
        %>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="ciudades.jsp">Ciudades</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="actividades.jsp">Actividades</a>
        </li>
          <li class="nav-item">
            <a class="nav-link " href="#">Sugerencias</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="#">Novedades</a>
          </li>
        </ul>
       <%-- <form class="d-flex" action="buscar.jsp">
        <input class="form-control me-2" type="search" name="buscar" placeholder="nombre de actividad" aria-label="search" required>
        <button class="btn btn-outline-success" type="submit" name>Buscar</button>
      </form>
      <pre>                    </pre>--%>
      <form class="form-inline">
         <pre>Bienvenid@, <strong><%=session.getAttribute("usuario") %></strong>.
           <a href="perfil.jsp" class="text-success">Tu perfil</a> (<a href="logout.jsp">Salir</a>)</pre>
      
        <%   
          } 
        %>
        </form>
    </div>
  </div> 
</nav>