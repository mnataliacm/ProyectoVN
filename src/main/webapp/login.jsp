<%@ page import="java.sql.*" %>
<%@ page import="edu.fpdual.proyectovn.model.connector.Connector" %>
<%-- 
    Author     : Natalia Castillo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
  Connection con;
  try {
    con = new Connector().getConnection();
  } catch (ClassNotFoundException | SQLException e) {
    throw new RuntimeException(e);
  }
  String usuario = request.getParameter("usuario");
  String password = request.getParameter("password");
  String sql = "SELECT * FROM usuario WHERE NomUsu LIKE ?";
  try (PreparedStatement ps = con.prepareStatement(sql)) {
    ps.setString(1, request.getParameter("usuario"));
    ResultSet resultSet = ps.executeQuery();
    resultSet.next();
    Integer idusu = resultSet.getInt("IDusu");
    String user = resultSet.getString("NomUsu");
    String pass = resultSet.getString("PassUsu");
    Integer ciudad = resultSet.getInt("IDciu");

    if (usuario.equals(user) && (password.equals(pass))) {
      if ((usuario.equals("Admin")) && password.equals("admin")) {
        session.setAttribute("usuario", usuario);
        response.sendRedirect("actividades.jsp");
      } else if (usuario.equals("Colaborador") && (password.equals("123456"))) {
        session.setAttribute("usuario", usuario);
        response.sendRedirect("perfilEmpresa.jsp");
      } else {
        session.setAttribute("idusu", idusu);
        session.setAttribute("usuario", usuario);
        session.setAttribute("ciudad", ciudad);
        response.sendRedirect("ciudades.jsp");
      }
    } else {
      session.setAttribute("error", "Usuario o contraseña incorrecto");
      response.sendRedirect("formularioLogin.jsp");
    }

  } catch (SQLException e) {
    session.setAttribute("error", "Usuario o contraseña incorrecto");
    response.sendRedirect("formularioLogin.jsp");
  }
%>
