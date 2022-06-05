<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="edu.fpdual.proyectovn.model.connector.Connector" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%-- 
    Author     : Natalia Castillo
--%>
<%
  Connection con;
  Statement s;
  boolean confirma;
  String editar = "UPDATE usuario SET "
      + " NomUsu = '" + request.getParameter("NomUsu")
      + "', ApeUsu = '" + request.getParameter("ApeUsu")
      + "', PassUsu = '" + request.getParameter("PassUsu")
      + "', Email = '" + request.getParameter("Email")
      + "', Movil = '" + request.getParameter("Movil")
      + "', IDciu = " + request.getParameter("IDciu")
      + " WHERE IDusu = " + Integer.parseInt(request.getParameter("IDusu"));
  try {
    con = new Connector().getConnection();
    s = con.createStatement();
    confirma = s.execute(editar);

  } catch (ClassNotFoundException | SQLException e) {
    throw new RuntimeException(e);
  }


  if (confirma) {
    session.setAttribute("icono", "<i class=\"bi bi-x-circle text-danger fs-1\"></i>");
    session.setAttribute("mensaje", "<p>Error, no se ha podido modificar el nuevo usuario</p>");
    session.setAttribute("enlace", "usuarios.jsp");
    session.setAttribute("col", "btn-lg btn-danger");
    response.sendRedirect("error.jsp");
  } else {
    session.setAttribute("icono", "<i class=\"bi bi-check2-circle text-primary fs-1\"></i>");
    session.setAttribute("mensaje", "<p>Usuario modificado con éxito.</p>");
    session.setAttribute("enlace", "usuarios.jsp");
    session.setAttribute("col", "btn-lg btn-primary");
    response.sendRedirect("ok.jsp");
  }
%>

<%--
  UsuarioService usuarioService = new UsuarioService(new UsuarioManagerImpl());
  Integer idusu = Integer.parseInt(request.getParameter("IDusu"));
  Usuario usuario = null;
  try {
    usuario = new UsuarioService(new UsuarioManagerImpl()).buscaIdUsuario(idusu);
    if (usuarioService.modificarUsuario(usuario)) {
      response.sendRedirect("ok.jsp");
    } else {
      response.sendRedirect("error.jsp");
    }
  } catch (SQLException | ClassNotFoundException e) {
    response.sendRedirect("error.jsp");
  }


--%>

