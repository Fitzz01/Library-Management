<%-- 
    Document   : updateBook
    Created on : Jan 22, 2023, 3:48:45 PM
    Author     : fitri
--%>

<%@page import="Dao.bookDao"%>
<jsp:useBean id="u" class="model.book"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%
    int i = bookDao.updateBook(u);
    response.sendRedirect("dashboardAdmin.jsp");
%>
