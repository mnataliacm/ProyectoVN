<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.fpdual.proyectovn.client.UsuarioClient" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Usuario" %>
<%-- 
    Author     : Natalia Castillo
--%>
<%
  // TODO: 07/06/2022 Pendiente
  UsuarioClient usuarioClient = new UsuarioClient();
  String nombre = request.getParameter("usuario");
  String password = request.getParameter("password");
  Usuario usuario = usuarioClient.buscaPorNombre(nombre);
  if (nombre.equals(usuario.getNom()) && (password.equals(usuario.getPass()))) {
    if ((nombre.equals("Admin")) && (password.equals("admin"))) {
      session.setAttribute("usuario", usuario);
      response.sendRedirect("actividades.jsp");
    } else if (nombre.equals("Colaborador") && (password.equals("123456"))) {
      session.setAttribute("usuario", usuario);
      response.sendRedirect("perfilEmpresa.jsp");
    } else {
      session.setAttribute("usuario", nombre);
      session.setAttribute("ciudad", usuario.getIdciu());
      response.sendRedirect("ciudades.jsp");
    }
  } else {
    session.setAttribute("error", "Usuario o contraseña incorrecto");
    response.sendRedirect("formularioLogin.jsp");
  }
%>
