<%@page import="com.emergentes.modelo.Controlcategoria"%>
<%@page import="com.emergentes.modelo.categorias"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
  if(session.getAttribute("agenda")==null){
  Controlcategoria objeto1 = new Controlcategoria();
  session.setAttribute("agenda",objeto1);
    }  
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL - categoria</title>
    </head>
    <body>
        <h1>Categorias</h1>
        <a href="ControllerCategoria?op=nuevo">Nuevo</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Categoria</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.categoria}</td>
                    <td><a href="ControllerCategoria?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="ControllerCategoria?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
        <p><a href="index.jsp">Ir al Inicio</a></td>
    </body>
</html>
