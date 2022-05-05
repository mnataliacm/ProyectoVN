<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Author     : Natalia Castillo
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
        <% // TODO: 01/05/2022 intentar reducir código eliminando del if las zonas comunes, y reparar buscador
         String user = (String) session.getAttribute("usuario");
         if (session.getAttribute("usuario") == null) {
        %>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="ciudades.jsp">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="formularioRegistro.jsp">Registrar</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="categorias.jsp">Categorias</a>
        </li>
          <li class="nav-item">
            <a class="nav-link" href="usuarios.jsp">Usuarios del</a>
          </li>
        </ul>
        <form class="d-flex" action="buscar.jsp">
        <input class="form-control me-2" type="search" name="buscar" placeholder="nombre de planta" aria-label="search" required>
        <button class="btn btn-outline-success" type="submit" name>Buscar</button>
      </form>
      <pre>                    </pre>
      <form class="form-inline">
         <a class="btn-lg btn-turquesa text-white p-2" href="formularioLogin.jsp">Iniciar sesion</a>
      </form>
      <!-- Administrador -->
        <%
          } else if ((session.getAttribute("usuario") != null) && (user.equals("Admin"))){
        %>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="usuarios.jsp">Usuarios</a>
        </li>
        </ul>
        <form class="form-inline">
         <pre>Bienvenid@, <strong><%=session.getAttribute("usuario") %></strong>. (<a href="logout.jsp">Salir</a>)</pre>
      </form>
      <!-- Colaborador -->
        <%
          } else if ((session.getAttribute("usuario") != null) && (user.equals("Colaborador"))) {
        %>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="buscador.jsp">Plantas</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" aria-current="page" href="familias.jsp">Familias</a>
        </li>
      </ul>
        <form class="d-flex" action="buscar.jsp">
        <input class="form-control me-2" type="search" name="buscar" placeholder="nombre de planta" aria-label="search" required>
        <button class="btn btn-outline-success" type="submit" name>Buscar</button>
      </form>
      <pre>                    </pre>
      <form class="form-inline">
         <pre>Bienvenid@, <strong><%=session.getAttribute("usuario") %></strong>. (<a href="logout.jsp">Salir</a>)</pre>
      </form>
      <!-- Usuario -->
        <%
        } else if (session.getAttribute("usuario") != null) {
        %>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="index.jsp">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="categorias.jsp">Categorias</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="tuJardin.jsp">Mi Jardin</a>
        </li>
        </ul>
        <form class="d-flex" action="buscar.jsp">
        <input class="form-control me-2" type="search" name="buscar" placeholder="nombre de planta" aria-label="search" required>
        <button class="btn btn-outline-success" type="submit" name>Buscar</button>
      </form>
      <pre>                    </pre>
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