<%-- 
    Document   : profileUser
    Created on : Jan 29, 2023, 2:24:23 PM
    Author     : fitri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.LoginUser"%>
<%@page import= "javax.servlet.http.HttpSession"%>

<jsp:useBean id = "username" scope = "session" class = "model.LoginUser"/>
<jsp:setProperty name="username" property="*" />

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" 
                   url="jdbc:derby://localhost:1527/library1" user="use" password="use"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Abel&family=Montserrat:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/profile.css">
        <title>User Profile Page</title>
    </head>
    <body>
        <sql:query var="result" dataSource="${myDatasource}">SELECT * FROM USE.USER2 WHERE LASTNAME='<%= username.getLastname()%>'</sql:query>

            <div class="container">
                <div class="shape">
                    <div class="image"></div>
                </div>

                <table class="table table-bordered table-striped">
                    <tbody id="myTable">
                    <c:forEach var="row" items="${result.rows}">
                        <tr>  
                            <td style="font-weight: bold;">First Name</td>
                            <td> <c:out value="${row.firstname}"/> </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;">Last Name</td>
                            <td> <c:out value="${row.lastname}"/> </td>
                        </tr>
                        <tr> 
                            <td style="font-weight: bold;">Email</td>
                            <td> <c:out value="${row.email}"/> </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <br><center><a href="dashboardUser.jsp" class="btn btn-primary">Back</a></center>
    </body>
</html>
