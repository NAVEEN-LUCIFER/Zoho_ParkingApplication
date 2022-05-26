<%--
  Created by IntelliJ IDEA.
  User: lucifer
  Date: 18/05/22
  Time: 5:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exit</title>
    <link rel="stylesheet" href="Exit.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>

<%
    if(session.getAttribute("username")==null)
    {
        response.sendRedirect("LogIN.jsp");
    }
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

%>


<div class="header">
    <h1>ENTER THE DETAILS</h1>
</div>
<div class="container">

    <form  method="post" action="Servlet_CheckOUT">
        <div class="row" id="no">
            <div class="col">Vehicle Number:</div>
            <div class="col"><label for="VehicleNo"></label><input id="VehicleNo" type="text" placeholder="Vehicle Number" name="VehicleNo" required></div>
        </div>
        <div class="row" id="date">
            <div class="col">Date And Time</div>
            <div class="col"><label for="ExitTime"></label><input id="ExitTime" type="datetime-local" name="ExitTime" placeholder="yyyy-mm-dd'T'HH:mm" required > </div>
        </div>
        <div class="footer">
            <button id="bt1" type="submit" >Get Fare</button>
            <a class="btn btn-dark" href="Home.jsp" >
                GO BACK
            </a>
        </div>
    </form>
</div>
</body>
</html>
