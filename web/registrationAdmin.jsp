<%-- 
    Document   : registrationUser
    Created on : Jan 8, 2023, 10:11:41 PM
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script type="text/javascript">
            function alertName() {
                alert("Successfully Registered");
                window.location.href = "dashboardAdmin.jsp";
            }
        </script>
        <style>
            body{
                padding: 1% 30%;
            }
            a{
                color: #ffbf00;
                text-decoration: none;
            }
            a:hover{
                color: #A435F7;
            }
            .container {
                background: white;
                padding: 0 50px;
                position: relative;
                display: grid;
                box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
}
        </style>
        <title>Registration Admin</title>
    </head>

    <body>
        <div class="container">
            <form action="registrationAdmin.jsp" method="POST">

                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" id="name" required>
                </div>               
                <div class="mb-3">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="text" name="phone" class="form-control" id="phone" required>
                </div>               
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="text" name="email" class="form-control" id="mail" required>
                </div>
                <div class="mb-3">
                    <label for="position" class="form-label">Position</label>
                    <input type="text" name="position" class="form-control" id="position" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="pass" required>
                </div>
                <div class="align-self-center mx-auto d-grid gap-2">
                    <button type='submit' class="btn btn-outline-primary">Sign Up</button>
                    <button onclick="location.href = 'dashboardAdmin.jsp';" id="myButton" class="btn btn-outline-primary" >Back</button><br>
                </div>

            </form>
        </div>

        <c:set var="name" value="${param.name}"/> 
        <c:set var="phone" value="${param.phone}"/> 
        <c:set var="email" value="${param.email}"/> 
        <c:set var="position" value="${param.position}"/> 
        <c:set var="password" value="${param.password}"/>

        <c:if test="${(name!=null)&&(phone!=null)&&(email!=null)&&(position!=null)&&(password!=null)}" var="result">
            <sql:update var="result" dataSource="${myDatasource}">
                INSERT INTO ADMINS
                VALUES (DEFAULT, ?, ?, ?, ?, ?)

                <sql:param value="${name}"/> 
                <sql:param value="${phone}"/> 
                <sql:param value="${email}"/>
                <sql:param value="${position}"/> 
                <sql:param value="${password}"/>

            </sql:update>

            <script type="text/javascript">
                window.onload = alertName;
            </script>
        </c:if>
    </body>
</html>
