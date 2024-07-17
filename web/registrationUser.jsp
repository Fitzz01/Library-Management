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
                window.location.href = "loginUser.jsp";
            }
        </script>
        <style>
            body{
                padding: 3% 30%;
            }
            a{
                color: #EABF04;
                text-decoration: none;
            }
            a:hover{
                color: #A435F7;
            }
            .container {
                background: white;
                border-radius: 10px;
                padding: 10%;
                position: relative;
                display: grid;
                box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
            }
        </style>
        <title>Registration User</title>
    </head>

    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <div class="container">
            <form action="registrationUser.jsp" method="POST">

                <div class="mb-3">
                    <label for="firstname" class="form-label">First Name</label>
                    <input type="text" name="firstname" class="form-control" id="firstname" required>
                </div>               
                <div class="mb-3">
                    <label for="lastname" class="form-label">Last Name</label>
                    <input type="text" name="lastname" class="form-control" id="lastname" required>
                </div>               
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="text" name="email" class="form-control" id="email" required>
                </div>               
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="password" required>
                </div>
                <br>
                <div class="d-grid gap-2">
                    <button type='submit' class="btn btn-outline-primary">Sign Up</button>
                    <button onclick="location.href = 'index.html';" id="myButton" class="btn btn-outline-primary" >Main Page</button><br>
                </div>

            </form> 
        </div>
        <br>
    <center><a href="loginUser.jsp" >Already Have an account? Click here</a></center>

    <c:set var="firstname" value="${param.firstname}"/> 
    <c:set var="lastname" value="${param.lastname}"/> 
    <c:set var="email" value="${param.email}"/> 
    <c:set var="password" value="${param.password}"/>

    <c:if test="${(firstname!=null)&&(lastname!=null)&&(email!=null)&&(password!=null)}" var="result">
        <sql:update var="result" dataSource="${myDatasource}">
            INSERT INTO USER2
            VALUES (DEFAULT, ?, ?, ?, ?)

            <sql:param value="${firstname}"/> 
            <sql:param value="${lastname}"/> 
            <sql:param value="${email}"/>
            <sql:param value="${password}"/>

        </sql:update>

        <script type="text/javascript">
            window.onload = alertName;
        </script>
    </c:if>
</body>
</html>
