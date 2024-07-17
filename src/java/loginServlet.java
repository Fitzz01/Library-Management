/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author fitri
 */
public class loginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        response.setHeader("Cache-Control", "no-chache , no-store, must-revalidate");
        String name = request.getParameter("lastname");
        String password = request.getParameter("password");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/library1", "use", "use");
            PreparedStatement ps = con.prepareStatement("select * from user2 where lastname='" + name + "' and password='" + password + "'");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                out.print("<script>alert(\"Welcome! " + name + "\");</script>");
                request.getRequestDispatcher("dashboardUser.jsp").include(request, response);
            } else {
                out.print("<script>\n"
                        + "  alert(\"Sorry, lastname or password error!\");\n"
                        + "</script>");
                request.getRequestDispatcher("loginUser.jsp").include(request, response);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.print("Driver error!");
            request.getRequestDispatcher("loginUser.jsp").include(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            out.print("SQL error!");
            request.getRequestDispatcher("loginUser.jsp").include(request, response);
        }

        out.close();

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
