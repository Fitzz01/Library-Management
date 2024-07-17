/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Dao.bookDao;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.book;

/**
 *
 * @author fitri
 */
@WebServlet("/updateBook2")
public class updateBook2 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            out.println("<h1>Update Book</h1>");
            String sid = request.getParameter("book_id");
            int id = Integer.parseInt(sid);

            book e = bookDao.getBookById(id);

            out.println("<form action='updateBook' method='post'>");
            out.println("<table>");
            out.println("<tr><td></td><td><input type='hidden' name='book_id' value='" + e.getBook_id() + "'/></td></tr>");
            out.println("<tr><td>Book Name:</td><td><input type='text' name='bookname' value='" + e.getBookname() + "'/></td></tr>");
            out.println("<tr><td>Category:</td><td><input type='text' name='category' value='" + e.getCategory() + "'/></td></tr>");
            out.println("<tr><td>Date Added:</td><td><input type='text' name='dateadded' value='" + e.getDateadded() + "'/></td></tr>");
            out.println("<tr><td colspan='2'><input type='submit' value='Edit & Save '/></td></tr>");
            out.println("</table>");
            out.println("</form>");

            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
