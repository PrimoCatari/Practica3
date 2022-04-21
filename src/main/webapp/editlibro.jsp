<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request">
                Registro de
            </c:if>
            <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request">
                Modificar
            </c:if>
                Libro
        </h1>
        <jsp:useBean id="miTarea" scope="request" class="com.emergentes.modelo.libros"/>
        <form action="ControllerLibro" method="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="id"
                               value="<jsp:getProperty name="miTarea" property="id"/>">
                        
                    </td>                          
                </tr>
                <tr>
                    <td>Titulo</td>
                    <td><input type="text" name="titulo"
                               value="<jsp:getProperty name="miTarea" property="titulo"/>">
                        
                    </td>
                </tr>
                <tr>
                    <td>Autor</td>
                    <td><input type="text" name="autor"
                               value="<jsp:getProperty name="miTarea" property="autor"/>">
                        
                    </td>
                </tr>
                <tr>
                    <td>Disponibilidad</td>
                    <td>
                        <select name="disponible">
                            <option value="Disponible"
                                    <c:if test="${miTarea.disponible=='Disponible'}"
                                          var="res" scope="request">
                                        selected
                                    </c:if>
                                        >Disponible</option>
                            <option value="Sala"
                                    <c:if test="${miTarea.disponible=='Sala'}"
                                          var="res" scope="request">
                                        selected
                                    </c:if>
                                        >Sala</option>
                            <option value="Domicilio"
                                    <c:if test="${miTarea.disponible=='Domicilio'}"
                                          var="res" scope="request">
                                        selected
                                    </c:if>
                                        >Domicilio</option>
                            <option value="Deteriorado"
                                    <c:if test="${miTarea.disponible=='Deteriorado'}"
                                          var="res" scope="request">
                                        selected
                                    </c:if>
                                        >Deteriorado</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Categoria</td>
                    <td><input type="text" name="categoria"
                               value="<jsp:getProperty name="miTarea" property="categoria"/>">
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="opg" value="${requestScope.op}"/>
                        <input type="hidden" name="op" value="grabar"/>
                    </td>
                    <td>
                        <input type="submit" value="Grabar"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
