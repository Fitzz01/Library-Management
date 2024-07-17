<%-- 
    Document   : editBook
    Created on : Jan 22, 2023, 6:32:29 PM
    Author     : fitri
--%>

<%@page import="Dao.bookDao"%>
<%@page import="model.book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            body{
                padding: 3% 30%;
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
                border-radius: 10px;
                padding: 6%;
                position: relative;
                display: grid;
                box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
            }
        </style>
        <title>Edit Book Page</title>
    </head>
    <body>
        <%  String id = request.getParameter("book_id");
            int book_id = Integer.parseInt(id);
            book e = bookDao.getBookById(book_id);
        %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <div class="container">
            <form action="updateBook" method="POST">

                <table>
                    <tr>
                        <td>ID</td>
                        <td><input type="text" name="book_id" class="form-control" value="<%= e.getBook_id()%>" readonly/></td>
                    </tr>
                    <tr>
                        <td>Book Name</td>
                        <td><input type="text" name="bookname" class="form-control" value="<%= e.getBookname()%>"/></td>
                    </tr>
                    <tr>
                        <td>Category</td>
                        <td><input type="text" name="category" class="form-control" value="<%= e.getCategory()%>"/></td>
                    </tr>
                    <tr>
                        <td>Date added of book</td>
                        <td><input type="date" name="dateadded" class="form-control" value="<%= e.getDateadded()%>"/></td>
                    </tr>
                </table>

                <br>

                <div class="align-self-center mx-auto d-grid gap-2">
                    <button type='submit' class="btn btn-outline-primary">Edit Save</button>
                    <button type='reset' class="btn btn-outline-primary">Reset</button>
                    <button onclick="location.href = 'dashboardAdmin.jsp';" id="myButton" class="btn btn-outline-primary" >Cancel</button><br>
                </div>          

            </form> 
        </div>
    </body>
</html>
