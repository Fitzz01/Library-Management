<%-- 
    Document   : home
    Created on : Jan 14, 2023, 5:46:01 PM
    Author     : fitri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "javax.servlet.http.HttpSession"%>
<%@page import="model.LoginAdmin"%>
<%@page import="model.book"%>

<jsp:useBean id = "adminname" scope = "session" class = "model.LoginAdmin"/>
<jsp:setProperty name="adminname" property="*" />

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
        <link rel="stylesheet" href="css/styleDashboardAdmin.css">
        <title>Dashboard Librarian Page</title>
    </head>

    <body>
        <sql:query var="result" dataSource="${myDatasource}">SELECT * FROM USE.BOOK</sql:query>

            <!--starting header-->
            <header class="shadow p-3 mb-3 border-bottom">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"></ul>
                    <p>Welcome <%= adminname.getName()%></p>
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none" id="dropdownUser1"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="img/profile.png" alt="mdo" width="40" height="40" class="rounded-circle">
                    </a>
                </div>
            </div>
        </header>
        <!--ending header-->

        <!--starting nav menu-->
        <div class="vh-100 d-flex align-items-center position-fixed start-0 top-0" role="navigation" style="z-index: 1;">
            <div class="p-2">
                <div id="mainNav">
                    <ul class="list-unstyled rounded ms-2">
                        <li><a class="vlink rounded border-0" href="registrationAdmin.jsp"><i class="fas fa-address-card"></i> <span>Add New Librarian</span></a></li>
                        <li><a class="vlink rounded" href="ViewUserBook.jsp"><i class="fas fa-eye"></i> <span>View User & Book</span></a></li>
                        <li><a class="vlink rounded" href="profileAdmin.jsp"><i class="fas fa-user-circle"></i> <span>Profile</span></a></li>
                        <li><a class="vlink rounded" href="logoutAdminServlet"><i class="fas fa-sign-out-alt"></i> <span>Sign Out</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!--ending nav menu-->
        
        <!--starting content-->
        <div class="container-context">
            <div class="container">
            <h1>List of Books</h1>
                <div class="input-group mb-3 w-50">
                    <input type="text" id="myInput" class="form-control" placeholder="Search for...">
                    <div class="input-group-append">
                        &nbsp;&nbsp;&nbsp;<a href="addBook.jsp"><button type="button" class="btn btn-primary"><i class="fas fa-plus"></i> Add Book</button></a>
                    </div>
                </div>
                <br>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <tr style="background: rgb(9,237,161); background: linear-gradient(76deg, rgba(9,237,161,1) 0%, rgba(21,175,228,1) 100%);">
                            <c:forEach var="columnName" items="${result.columnNames}">
                                <th><c:out value="${columnName}"/></th>
                                </c:forEach>
                            <th>ACTION</th>
                        </tr>
                        <tbody id="myTable">
                            <c:forEach var="row" items="${result.rows}">
                                <tr>
                                    <td style="font-weight: bold;"> <c:out value="${row.book_id}"/> </td>
                                    <td> <c:out value="${row.bookname}"/> </td>
                                    <td> <c:out value="${row.category}"/> </td>
                                    <td> <c:out value="${row.dateadded}"/> </td>
                                    <td><button onclick="window.location.href = 'editBook.jsp?book_id=${row.book_id}'" class="btn btn-success btn-round btn-just-icon btn-sm" title="Edit Book Detail"><i class="far fa-edit"></i></button>
                                        <button onclick="window.location.href = 'deleteBook?book_id=${row.book_id}'" class="btn btn-danger btn-round btn-just-icon btn-sm " title="Delete Book"><i class="fas fa-trash"></i></button> </td>                
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--ending content-->

        <!--starting footer-->
        <div class="footer">
            <p>Copyright &#169; Library Management System</p>
        </div>
        <!--ending footer-->
        
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
