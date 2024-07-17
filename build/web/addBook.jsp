<%-- 
    Document   : addBook
    Created on : Jan 21, 2023, 11:28:13 AM
    Author     : fitri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "javax.servlet.http.HttpSession"%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" 
                   url="jdbc:derby://localhost:1527/library1" user="use" password="use"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/styleAddBook.css">
        <script>
            function change_loc(url) {
                document.location.href = url;
            }
            function alertName(){
                alert("Successfully Add New Book");
                window.location.href = "dashboardAdmin.jsp";
            }
        </script>
        <title>Add Book Page</title>
    </head>
    
    
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <div class="container">
            <form action="addBook.jsp" method="POST">

                <div class="mb-3">
                    <label for="bookname" class="form-label">Title of Book</label>
                    <input type="text" name="bookname" class="form-control" id="bookname" value="${param.bookname}" required>
                </div>           
                <div class="mb-3">
                    <label for="category" class="form-label">Category</label>
                    <input type="text" name="category" class="form-control" id="category" value="${param.category}" required>
                </div>
                <div class="mb-3">
                    <label for="dateadded" class="form-label">Date added of book</label>
                    <input type="date" name="dateadded" class="form-control" id="dateadded" value="${param.dateadded}" required>
                </div>
                <br>
                <div class="align-self-center mx-auto d-grid gap-2">
                    <button type='submit' class="btn btn-outline-primary">Save</button>
                    <button onclick="location.href = 'dashboardAdmin.jsp';" id="myButton" class="btn btn-outline-primary" >Back</button><br>
                </div>          

            </form> 
        </div>
        
        <c:set var="bookname" value="${param.bookname}"/> 
        <c:set var="category" value="${param.category}"/> 
        <c:set var="dateadded" value="${param.dateadded}"/>
        
        <c:if test="${(bookname!=null)&&(category!=null)&&(dateadded!=null)}" var="result">
            <sql:update var="result" dataSource="${myDatasource}">
                INSERT INTO BOOK
                VALUES (DEFAULT, ?, ?, ?)
                
                <sql:param value="${bookname}"/> 
                <sql:param value="${category}"/> 
                <sql:param value="${dateadded}"/>             
            </sql:update>
                
            <script type="text/javascript">
                window.onload = alertName;
            </script>
        </c:if>

    </body>
</html>
