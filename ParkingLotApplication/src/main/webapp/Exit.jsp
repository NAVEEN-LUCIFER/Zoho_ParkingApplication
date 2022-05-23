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
<div class="header">
    <h1>ENTER THE DETAILS</h1>
</div>
<div class="container">

    <form  method="post" action="Servlet_CheckOUT">
        <div class="row" id="no">
            <div class="col">Vehicle Number:</div>
            <div class="col"><input id="VehicleNo" type="text" placeholder="Vehicle Number" name="VehicleNo" required></div>
        </div>
        <div class="row" id="date">
            <div class="col">Date And Time</div>
            <div class="col"> <input id="ExitTime" type="datetime-local" name="ExitTime" placeholder="yyyy-mm-dd'T'HH:mm" required > </div>
        </div>
        <div class="footer">
            <button id="bt1" type="submit" >Get Fare</button>
        </div>
    </form>
    <div class="footer">
        <a href="Home.jsp">
            <button id="bt2" type="submit" >Go Back</button>
        </a>
    </div>
</div>
</body>
</html>
