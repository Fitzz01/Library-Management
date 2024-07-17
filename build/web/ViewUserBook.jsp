<%-- 
    Document   : ViewUserBook
    Created on : Jan 23, 2023, 1:05:33 AM
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
        <title>View User and their Book</title>
        <style>
            *{
                font-family: 'Abel', sans-serif;
            }
            .container {
                background: white;
                border-radius: 10px;
                padding: 3%;
                position: relative;
                display: grid;
                box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
            }
            h2{
                text-align: center;
            }
            .table-responsive{
                max-height: 300px;
                overflow: auto;
                display:inline-block;
            }
        </style>
    </head>
    <body>

        <br><br><h2>View User & their books</h2>
        <%@page import="model.book"%>
        <sql:query var="result" dataSource="${myDatasource}">SELECT * FROM USE.RECORD</sql:query>

            <div class="container">
                <div class="input-group mb-3 w-50">
                    <input type="text" id="myInput" class="form-control" placeholder="Search by user name...">
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <tr style="background: rgb(9,237,161); background: linear-gradient(76deg, rgba(9,237,161,1) 0%, rgba(21,175,228,1) 100%);">
                            <th>RECORD ID</th>
                            <th>DATE BORROW</th>
                            <th>DATE RETURN</th>
                            <th>BOOK NAME</th>
                            <th>USER NAME</th>
                        </tr>
                        <tbody id="myTable">
                        <c:forEach var="row" items="${result.rows}">
                            <tr>
                                <td style="font-weight: bold;"> <c:out value="${row.record_id}"/> </td>
                                <td> <c:out value="${row.dateborrow}"/> </td>
                                <td> <c:out value="${row.datereutrn}"/> </td>
                                <td> <c:out value="${row.bookname}"/> </td>
                                <td> <c:out value="${row.username}"/> </td> 
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>       
        </div>
    <br><center><a href="dashboardAdmin.jsp" class="btn btn-primary">Back</a></center><br>
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>
