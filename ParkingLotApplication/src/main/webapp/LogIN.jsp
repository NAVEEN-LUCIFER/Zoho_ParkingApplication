<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: lucifer
  Date: 20/05/22
  Time: 4:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="UserLogin.css">
</head>
<body>


<form action="login" method="post">
    <h2 id="greet" style="display:flex; margin-top: 2%; justify-content:center; align-content:center; color:gray;"><strong>WELCOME   TO   LOGIN   PAGE!</strong></h2>
    <div class="container" style="margin-top: 3%">
        <label for="uname" style="color: white"><b>Username</b></label>
        <input type="text" placeholder="Enter Username" id="uname" name="uname" required>

        <label for="psw" style="color: white"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" id="psw" name="psw" required>
        <label style="color: white">
            <input type="checkbox" checked="checked"  name="remember"> Remember me
        </label>
        <button id="submit" name="submit" class="btn btn-primary" style="text-decoration: none;">Login</button>

    </div>

    <div class="container" style="width: 40%;">
        <button type="reset" class="cancelBtn">Cancel</button>
    </div>
</form>


</body>
</html>
