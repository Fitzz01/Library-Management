<%-- 
    Document   : ViewBookByUSer
    Created on : Jan 24, 2023, 2:42:55 PM
    Author     : fitri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "javax.servlet.http.HttpSession"%>
<%@page import="model.book"%>
<%@page import="model.LoginUser"%>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Abel', sans-serif;
                top: 50%;
                left: 50%;
                width: 50%;
                position: absolute;
                transform: translate(-50%, -50%);
            }
            .container {
                background: white;
                border-radius: 10px;
                padding: 7%;
                position: relative;
                display: grid;
                box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
            }
            .table-responsive{
                max-height: 350px;
                overflow: auto;
                display:inline-block;
            }
        </style>
        <script>
            function change_loc(url) {
                document.location.href = url;
            }
            function alertName() {
                alert("Successfully Delete Book");
                window.location.href = "dashboardUser.jsp";
            }
        </script>
        <title>View By User Page</title>
    </head>
    <body>
        <h2>Your Books</h2>
        <sql:query var="result" dataSource="${myDatasource}">SELECT * FROM USE.RECORD WHERE USERNAME='<%= username.getLastname()%>'</sql:query>

            <div class="container">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>RECORD ID</th>
                            <th>DATE BORROW</th>
                            <th>DATE RETURN</th>
                            <th>BOOK NAME</th>
                            <th>USER NAME</th>
                            <th>ACTION</th>
                        </tr>
                        <tbody id="myTable">
                        <c:forEach var="row" items="${result.rows}">
                            <tr>
                                <td> <c:out value="${row.record_id}"/> </td>
                                <td> <c:out value="${row.dateborrow}"/> </td>
                                <td> <c:out value="${row.datereutrn}"/> </td>
                                <td> <c:out value="${row.bookname}"/> </td>
                                <td> <c:out value="${row.username}"/> </td>
                                <td><button onclick="window.location.href = 'deleteRecordBook?record_id=${row.record_id}'" class="btn btn-danger btn-round btn-just-icon btn-sm " title="Delete Book"><i class="fas fa-trash"></i></button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>       
        </div>
    <br><center><a href="dashboardUser.jsp" class="btn btn-primary">Back</a></center>
</body>
</html>
