<%@page import="java.sql.Connection"%>
<%@ page import="edu.fpdual.proyectovn.model.connector.Connector" %>
<%--
    Author     : Natalia Castillo
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Connector connector = new Connector();
  Connection con = connector.getConnection();

%>
