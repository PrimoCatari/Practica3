<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Controllibro" %>
<%@page import="com.emergentes.modelo.libros" %>

<%
  if(session.getAttribute("agenda")==null){
  Controllibro objeto1 = new Controllibro();
  session.setAttribute("agenda",objeto1);
    }  
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL - libros</title>
    </head>
    <body>
        <h1>Libros</h1>
        <a href="ControllerLibro?op=nuevo">Nuevo</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Disponible</th>
                <th>Categoria</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.titulo}</td>
                    <td>${item.autor}</td>
                    <td>${item.disponible}</td>
                    <td>${item.categoria}</td>
                    <td><a href="ControllerLibro?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="ControllerLibro?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
        <p><a href="index.jsp">Ir al Inicio</a></td>
    </body>
</html>

