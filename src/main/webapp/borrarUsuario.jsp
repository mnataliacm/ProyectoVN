<%@ page import="edu.fpdual.proyectovn.service.UsuarioService" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.implement.UsuarioManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.model.dao.Usuario" %>
<%@ page import="java.sql.SQLException" %>
<%-- 
    Author     : Natalia Castillo Muñoz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
      UsuarioService usuarioService = new UsuarioService(new UsuarioManagerImpl());
      int idusu = Integer.parseInt(request.getParameter("IDusu"));
      Usuario usuario;
      try {
        usuario = usuarioService.buscaId(idusu);
      } catch (SQLException | ClassNotFoundException e) {
        throw new RuntimeException(e);
      }
      try {
        usuarioService.borrarUsuario(idusu);
      } catch (SQLException | ClassNotFoundException e) {
        throw new RuntimeException(e);
      }
    %>
