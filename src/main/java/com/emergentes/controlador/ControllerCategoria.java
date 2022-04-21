
package com.emergentes.controlador;

import com.emergentes.modelo.Controlcategoria;
import com.emergentes.modelo.categorias;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ControllerCategoria", urlPatterns = {"/ControllerCategoria"})
public class ControllerCategoria extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        categorias obj2 = new categorias();
        int id;
        int pos;
        String opcion = request.getParameter("op");
        String op = (opcion != null)? request.getParameter("op"):"view";
        if (op.equals("nuevo")){
            HttpSession ses = request.getSession();
            Controlcategoria agenda = (Controlcategoria) ses.getAttribute("agenda");
            obj2.setId(agenda.obtieneIdcategoria());
            request.setAttribute("op", op);
            request.setAttribute("miTarea", obj2);
            request.getRequestDispatcher("editcategoria.jsp").forward(request, response);
            
        }
        if (op.equals("modificar")){
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            Controlcategoria agenda = (Controlcategoria) ses.getAttribute("agenda");
            pos = agenda.ubicarcategoria(id);
            obj2 = agenda.getLista().get(pos);
            request.setAttribute("op", op);
            request.setAttribute("miTarea", obj2);
            request.getRequestDispatcher("editcategoria.jsp").forward(request, response);
        }
        if (op.equals("eliminar")){
            id = Integer.parseInt(request.getParameter("id"));
             HttpSession ses = request.getSession();
            Controlcategoria agenda = (Controlcategoria) ses.getAttribute("agenda");
            pos = agenda.ubicarcategoria(id);
            agenda.eliminarcategoria(pos);
            ses.setAttribute("agenda", agenda);
            response.sendRedirect("categoria.jsp");
        }
        if(op.equals("view")){
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        categorias obj2 = new categorias();
        int pos;
        String op = request.getParameter("op");
        if(op.equals("grabar")){
            obj2.setId(Integer.parseInt(request.getParameter("id")));
            obj2.setCategoria(request.getParameter("categoria"));
            HttpSession ses = request.getSession();
            Controlcategoria agenda = (Controlcategoria) ses.getAttribute("agenda");
            String opg=request.getParameter("opg");
            if (opg.equals("nuevo")){
                agenda.insertarcategoria(obj2);
            }else{
                pos=agenda.ubicarcategoria(obj2.getId());
                agenda.modificarcategoria(pos, obj2);
            }
            ses.setAttribute("agenda", agenda);
            response.sendRedirect("categoria.jsp");
        }
    }
}
