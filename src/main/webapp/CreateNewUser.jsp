<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.RequestDispatcher" %>
<%--
  Created by IntelliJ IDEA.
  User: lucifer
  Date: 25/05/22
  Time: 9:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="UTF-8">
    <title>Entry</title>
    <link rel="stylesheet" href="Entry.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


</head>
<body>


<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("AdminLogin.jsp");
    }
%>

<div class="header">
    <h1>ENTER THE DETAILS</h1>
</div>

<div class="container">

    <form method="post" action="ServletCreateNewUser">

        <div class="row" id="name">
            <div class="col">User name:</div>
            <div class="col"><label for="OwnerName"></label><input id="OwnerName" type="text" placeholder="Name"
                                                                   name="Name" required></div>
        </div>

        <div class="row" id="no">
            <div class="col">Password:</div>
            <div class="col"><label for="VehicleNo"></label><input id="VehicleNo" type="text" placeholder="Password"
                                                                   name="Pass" required></div>
        </div>

        <div class="footer"><br>
            <button id="bt1" name="sub" value="submit" type="submit">Create</button>
            <a class="btn btn-dark" href="AdminHome.jsp">
                Go Back
            </a>
        </div>
    </form>
</div>
</body>
</html>

