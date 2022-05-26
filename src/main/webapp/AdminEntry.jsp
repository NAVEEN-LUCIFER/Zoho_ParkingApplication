<%--
  Created by IntelliJ IDEA.
  User: lucifer
  Date: 25/05/22
  Time: 7:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="UTF-8">
    <title>Entry</title>
    <link rel="stylesheet" href="Entry.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>


<%
    if(session.getAttribute("username")==null)
    {
        response.sendRedirect("AdminLogin.jsp");
    }
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

%>

<div class="header">
    <h1>ENTER THE DETAILS</h1>
</div>
<div class="container">

    <form  method="post" action="ServletAdminCheckIn">

        <div class="row" id="name">
            <div class="col">Owner name:</div>
            <div class="col"><label for="OwnerName"></label><input id="OwnerName" type="text" placeholder="Name" name="OwnerName" required></div>
        </div>

        <div class="row" id="no">
            <div class="col">Vehicle Number:</div>
            <div class="col"><label for="VehicleNo"></label><input id="VehicleNo" type="text" placeholder="Vehicle Number" name="VehicleNo" required></div>
        </div>

        <div class="row" id="type">
            <div class="col">Vehicle Type</div>
            <div class="col"><label for="RadioCar"></label><input id="RadioCar" type="radio" value="car" name="radio" required>CAR</div>
            <div class="col"><label for="RadioBike"></label><input id="RadioBike" type="radio" value="bike" name="radio">BIKE</div>
        </div>

        <div class="row" id="date">
            <div class="col">Date And Time</div>
            <div class="col"><label for="EntryTime"></label><input id="EntryTime" type="datetime-local" name="EntryTime" placeholder="yyyy-mm-dd'T'HH:mm" required > </div>
        </div>

        <div class="row" id="lot">
            <div class="col">CHOOSE LOT</div>
            <div class="col">
                <label>
                    <select name="lot" required>
                        <option value="A - 1">A - 1</option>
                        <option value="A - 2">A - 2</option>
                        <option value="A - 3">A - 3</option>
                        <option value="A - 4">A - 4</option>
                        <option value="A - 5">A - 5</option>
                        <option value="B - 1">B - 1</option>
                        <option value="B - 2">B - 2</option>
                        <option value="B - 3">B - 3</option>
                        <option value="B - 4">B - 4</option>
                        <option value="B - 5">B - 5</option>
                        <option value="C - 1">C - 1</option>
                        <option value="C - 2">C - 2</option>
                        <option value="C - 3">C - 3</option>
                        <option value="C - 4">C - 4</option>
                        <option value="C - 5">C - 5</option>
                        <option value="D - 1">D - 1</option>
                        <option value="D - 2">D - 2</option>
                        <option value="D - 3">D - 3</option>
                        <option value="D - 4">D - 4</option>
                        <option value="D - 5">D - 5</option>
                        <option value="E - 1">E - 1</option>
                        <option value="E - 2">E - 2</option>
                        <option value="E - 3">E - 3</option>
                        <option value="E - 4">E - 4</option>
                        <option value="E - 5">E - 5</option>
                        <option value="F - 1">F - 1</option>
                        <option value="F - 2">F - 2</option>
                        <option value="F - 3">F - 3</option>
                        <option value="F - 4">F - 4</option>
                        <option value="F - 5">F - 5</option>
                        <option value="G - 1">G - 1</option>
                        <option value="G - 2">G - 2</option>
                        <option value="G - 3">G - 3</option>
                        <option value="G - 4">G - 4</option>
                        <option value="G - 5">G - 5</option>
                        <option value="H - 2">H - 2</option>
                        <option value="H - 3">H - 3</option>
                        <option value="H - 4">H - 4</option>
                        <option value="H - 5">H - 5</option>
                        <option value="I - 1">I - 1</option>
                        <option value="I - 2">I - 2</option>
                        <option value="I - 3">I - 3</option>
                        <option value="I - 4">I - 4</option>
                        <option value="I - 5">I - 5</option>
                        <option value="J - 1">J - 1</option>
                        <option value="J - 2">J - 2</option>
                        <option value="J - 3">J - 3</option>
                        <option value="J - 4">J - 4</option>
                        <option value="J - 5">J - 5</option>
                        <option value="K - 1">K - 1</option>
                        <option value="K - 2">K - 2</option>
                        <option value="K - 3">K - 3</option>
                        <option value="K - 4">K - 4</option>
                        <option value="K - 5">K - 5</option>
                        <option value="L - 1">L - 1</option>
                        <option value="L - 2">L - 2</option>
                        <option value="L - 3">L - 3</option>
                        <option value="L - 4">L - 4</option>
                        <option value="L - 5">L - 5</option>
                        <option value="M - 1">M - 1</option>
                        <option value="M - 2">M - 2</option>
                        <option value="M - 3">M - 3</option>
                        <option value="M - 4">M - 4</option>
                        <option value="M - 5">M - 5</option>
                        <option value="N - 1">N - 1</option>
                        <option value="N - 2">N - 2</option>
                        <option value="N - 3">N - 3</option>
                        <option value="N - 4">N - 4</option>
                        <option value="N - 5">N - 5</option>
                        <option value="O - 1">O - 1</option>
                        <option value="O - 2">O - 2</option>
                        <option value="O - 3">O - 3</option>
                        <option value="O - 4">O - 4</option>
                        <option value="O - 5">O - 5</option>
                        <option value="P - 1">P - 1</option>
                        <option value="P - 2">P - 2</option>
                        <option value="P - 3">P - 3</option>
                        <option value="P - 4">P - 4</option>
                        <option value="P - 5">P - 5</option>
                        <option value="Q - 1">Q - 1</option>
                        <option value="Q - 2">Q - 2</option>
                        <option value="Q - 3">Q - 3</option>
                        <option value="Q - 4">Q - 4</option>
                        <option value="Q - 5">Q - 5</option>
                        <option value="R - 1">R - 1</option>
                        <option value="R - 2">R - 2</option>
                        <option value="R - 3">R - 3</option>
                        <option value="R - 4">R - 4</option>
                        <option value="R - 5">R - 5</option>
                        <option value="S - 1">S - 1</option>
                        <option value="S - 2">S - 2</option>
                        <option value="S - 3">S - 3</option>
                        <option value="S - 4">S - 4</option>
                        <option value="S - 5">S - 5</option>
                        <option value="T - 1">T - 1</option>
                        <option value="T - 2">T - 2</option>
                        <option value="T - 3">T - 3</option>
                        <option value="T - 4">T - 4</option>
                        <option value="T - 5">T - 5</option>
                        <option value="U - 1">U - 1</option>
                        <option value="U - 2">U - 2</option>
                        <option value="U - 3">U - 3</option>
                        <option value="U - 4">U - 4</option>
                        <option value="U - 5">U - 5</option>
                        <option value="V - 1">V - 1</option>
                        <option value="V - 2">V - 2</option>
                        <option value="V - 3">V - 3</option>
                        <option value="V - 4">V - 4</option>
                        <option value="V - 5">V - 5</option>
                        <option value="W - 1">W - 1</option>
                        <option value="W - 2">W - 2</option>
                        <option value="W - 3">W - 3</option>
                        <option value="W - 4">W - 4</option>
                        <option value="W - 5">W - 5</option>
                        <option value="X - 1">X - 1</option>
                        <option value="X - 2">X - 2</option>
                        <option value="X - 3">X - 3</option>
                        <option value="X - 4">X - 4</option>
                        <option value="X - 5">X - 5</option>
                        <option value="Y - 1">Y - 1</option>
                        <option value="Y - 2">Y - 2</option>
                        <option value="Y - 3">Y - 3</option>
                        <option value="Y - 4">Y - 4</option>
                        <option value="Y - 5">Y - 5</option>
                    </select>
                </label>
            </div>
        </div>
        <div class="footer"><br>
            <button id="bt1" type="submit" >Park Now</button>
            <a class="btn btn-dark" href="AdminHome.jsp">
                Go Back
            </a>
        </div>
    </form>
</div>


</body>
</html>
