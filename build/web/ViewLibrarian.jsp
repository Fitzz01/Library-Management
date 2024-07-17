<%-- 
    Document   : ViewLibrarian
    Created on : Jan 22, 2023, 10:41:25 PM
    Author     : fitri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>List of Librarians Page</title>
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
    </head>
    <body>

        <%@page import="model.LoginAdmin"%>
        <sql:query var="result" dataSource="${myDatasource}">SELECT * FROM USE.ADMINS</sql:query>

            <h1>List of Librarians</h1>

            <div class="container">

                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>PHONE</th>
                            <th>EMAIL</th>
                            <th>POSITION</th>
                        </tr>
                        <tbody id="myTable">
                        <c:forEach var="row" items="${result.rows}">
                            <tr>
                                <td> <c:out value="${row.id}"/> </td>
                                <td> <c:out value="${row.name}"/> </td>
                                <td> <c:out value="${row.phone}"/> </td>
                                <td> <c:out value="${row.email}"/> </td>
                                <td> <c:out value="${row.position}"/> </td> 
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div> 
        </div>
    <br><center><a href="dashboardUser.jsp" class="btn btn-primary">Back</a></center>
</body>
</html>
