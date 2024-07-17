<%-- 
    Document   : recordBook
    Created on : Jan 23, 2023, 1:16:44 AM
    Author     : fitri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" 
                   url="jdbc:derby://localhost:1527/library1" user="use" password="use"/>

<jsp:useBean id = "username" scope = "session" class = "model.LoginUser"/>
<jsp:setProperty name="username" property="*" />


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>Record Page</title>
        <style>
            body{
                padding: 10% 30%;
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
        <script>
            function change_loc(url) {
                document.location.href = url;
            }
            function alertName() {
                alert("Successfully Borrow New Book");
                window.location.href = "dashboardUser.jsp";
            }
        </script>
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <div class="container">
            <form action="" method="POST">
                <div class="mb-3">
                    <label for="dateborrow" class="form-label">Date Borrow of Book</label>
                    <input type="date" name="dateborrow" class="form-control" id="dateborrow" required>
                </div>
                <div class="mb-3">
                    <label for="datereturn" class="form-label">Date Return of Book</label>
                    <input type="date" name="datereturn" class="form-control" id="datereturn"required>
                </div>
                <div class="mb-3">
                    <label for="bookname" class="form-label">Book Name</label>
                    <input type="text" name="bookname" class="form-control" id="bookname" value="${param.book_name}" readonly>
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="test" name="username" class="form-control" id="username" value="<%= username.getLastname()%>" readonly>
                </div>
                <br>
                <div class="align-self-center mx-auto d-grid gap-2">
                    <button type='submit' class="btn btn-outline-primary">Save</button>
                    <button onclick="location.href = 'dashboardUser.jsp';" id="myButton" class="btn btn-outline-primary">Back</button><br>
                </div>          
            </form> 
        </div>
        
        <c:set var="dateborrow" value="${param.dateborrow}"/> 
        <c:set var="datereturn" value="${param.datereturn}"/>
        <c:set var="bookName" value="${param.book_name}"/>
        <c:set var="username" value="<%= username.getLastname()%>"/>
        
        
        
         <c:if test="${(dateborrow!=null)&&(datereturn!=null)}" var="result">
            <sql:update var="result" dataSource="${myDatasource}">
                INSERT INTO RECORD
                VALUES (DEFAULT, ?,?,?,?)
                
                <sql:param value="${dateborrow}"/> 
                <sql:param value="${datereturn}"/>
                <sql:param value="${bookName}"/>
                <sql:param value="${username}"/>
                
            </sql:update>
                
            <script type="text/javascript">
                window.onload = alertName;
            </script>
        </c:if>
        
    </body>
</html>
