package com.emergentes.controlador;

import com.emergentes.dao.AvisoDAO;
import com.emergentes.dao.AvisoDAOimpl;
import com.emergentes.modelo.Aviso;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="AvisoController", urlPatterns={"/AvisoController"})
public class AvisoController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            AvisoDAO dao = new AvisoDAOimpl();
            int id;
            Aviso avi = new Aviso();
            
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            
            switch(action){
                case "add":
                    request.setAttribute("aviso", avi);
                    request.getRequestDispatcher("frmaviso.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    avi = dao.getById(id);
                    request.setAttribute("aviso", avi);
                    request.getRequestDispatcher("frmaviso.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect(request.getContextPath()+"/AvisoController");
                    break;
                case "view":
                    List<Aviso> lista = dao.getAll();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("avisos.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            Logger.getLogger(Inicio.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String descripcion = request.getParameter("descripcion");
        int stock = Integer.parseInt(request.getParameter("stock"));
        
        Aviso avi = new Aviso();
        
        avi.setId(id);
        avi.setDescripcion(descripcion);
        avi.setStock(stock);
        
        if (id == 0){
            try {
                AvisoDAO dao = new AvisoDAOimpl();
                dao.insert(avi);
                response.sendRedirect(request.getContextPath()+"/AvisoController");
            } catch (Exception ex) {
                Logger.getLogger(Inicio.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else {
            try {
                AvisoDAO dao = new AvisoDAOimpl();
                dao.update(avi);
                response.sendRedirect(request.getContextPath()+"/AvisoController");
            } catch (Exception ex) {
                Logger.getLogger(Inicio.class.getName()).log(Level.SEVERE, null, ex);
            }            
        }

    }
}
