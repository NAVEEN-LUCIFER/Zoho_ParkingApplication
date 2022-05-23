<%--
  Created by IntelliJ IDEA.
  User: lucifer
  Date: 18/05/22
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HOME</title>
    <link rel="stylesheet" href="Home.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<nav>
    <div class="row navbar">
        <div class="col">
            <a href="Home.jsp">Home</a>
            <a href="History.jsp">Lot Details</a>
            <a href="GetDetails.jsp">My History</a>
        </div>
        <div class="col">
            <div class="dropdown">
                <button class="dropbtn">Dropdown
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="Entry.jsp">Check-In</a>
                    <a href="Exit.jsp">Check-Out</a>
                </div>
            </div>
        </div>
        <div class="col">
            <a href="ServletReset" id="right"> Reset <i class="fa fa-minus-circle" aria-hidden="true"></i></a>
            <a href="LogIN.jsp" id="right1"> Logout <i class="fa fa-sign-out" aria-hidden="true"></i></a></li>
        </div>
    </div>
</nav>

<form action="index.jsp" method="get">
    <div class="idImg">
        <img src="park.png">
    </div>
    <div class="panel panel-default card">
        <div class="panel-heading"><STRONG>WELCOME!</STRONG></div>
        <br>
        <div class="panel-body">SERVICES PROVIDED IN THIS LOT</div>
        <br>
        <div class="panel-body">BIKE PARKING - $10/hour</div>
        <br>
        <div class="panel-body">CAR PARKING - $50/hour</div>
        <br>
        <button class="btn btn-primary">Go To Options</button>
        <br>
    </div>
</form>

</body>
</html>