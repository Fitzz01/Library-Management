<%-- 
    Document   : loginUser
    Created on : Jan 8, 2023, 10:12:03 PM
    Author     : fitri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script>
            function change_loc(url) {
                document.location.href = url;
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
        <title>Login User</title>
    </head>

    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <div class="container">
            <form action="loginServlet" method="POST">

                <div class="mb-3">
                    <label for="lastname" class="form-label">Last Name</label>
                    <input type="text" name="lastname" class="form-control" id="lastname" required>
                </div>           
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" id="password" required>
                </div>           
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="normaluser" id="normaluser" onclick="change_loc('loginUser.jsp')">
                    <label class="form-check-label" for="normaluser">
                        User
                    </label>
                </div>           
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="admin" id="admin" onclick="change_loc('loginAdmin.jsp')">
                    <label class="form-check-label" for="admin">
                        Admin
                    </label>
                </div>
                
                <br><br>

                <div class="d-grid gap-2">
                    <button type='submit' class="btn btn-outline-primary">Log In</button>
                    <button onclick="location.href = 'index.html';" id="myButton" class="btn btn-outline-primary" >Main Page</button><br>
                </div>          

            </form>
        </div>
        <br>
    <center><a href="registrationUser.jsp">Don't have an account yet? Click here</a> </center>
</body>
</html>
