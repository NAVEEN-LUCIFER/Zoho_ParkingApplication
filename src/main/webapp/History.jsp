<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %> <%--
  Created by IntelliJ IDEA.
  User: lucifer
  Date: 20/05/22
  Time: 7:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lot Details</title>
    <link rel="stylesheet" href="Details.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.0/css/jquery.dataTables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.0/js/jquery.dataTables.min.js"></script>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <style>
        table,thead, tr, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#tableid').DataTable();
        });
    </script>
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

<%
    String url = "jdbc:mariadb://localhost:3306/ParkingDetails";
    String user = "root";
    String pass = "root";

    try {
        Class.forName("org.mariadb.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }


    try {
        Connection connection = DriverManager.getConnection(url, user, pass);
        %>

<div style="background: bisque">
    <p style="margin-left: 50%; font-size: larger; font-weight: bolder;">Lot History DETAILS</p>
</div>

<table id="tableid" style="width: 50%">
    <thead>

        <tr>
            <th colspan="5"><STRONG> Lot-History </STRONG></th>
        </tr>
        <tr>
            <th>OwnerName</th>
            <th>Vehicle Number</th>
            <th>Vehicle Type</th>
            <th>Entry Time</th>
            <th>Lot Block</th>
        </tr>

    </thead>
    <tbody>

    <% String Str = "SELECT OwnerName,VehicleNumber,VehicleType,EntryTime,LotBlock FROM Parking WHERE VehicleNumber IS NOT NULL";
        Statement st1 = connection.createStatement();
        ResultSet res1 = st1.executeQuery(Str);
        for (int i = 0; i < 25 && res1.next(); i++) {
            String Name, No, Ty, LB;
    %>

    <tr>
        <td><%=res1.getString("OwnerName")%></td>
        <td><%=res1.getString("VehicleNumber")%></td>
        <td><%=res1.getString("VehicleType")%></td>
        <td><%=res1.getString("EntryTime")%></td>
        <td><%=res1.getString("LotBlock")%></td>
    </tr>
    <%     }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    %>

    </tbody>
    <tfoot>

        <tr>
            <th>OwnerName</th>
            <th>Vehicle Number</th>
            <th>Vehicle Type</th>
            <th>Entry Time</th>
            <th>Lot Block</th>
        </tr>

    </tfoot>
</table>
<div class="footer">
    <a href="AdminHome.jsp" id="ReturnOpt" class="btn btn-primary" type="button">Return To Options</a>
</div>
</body>
</html>
