<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: lucifer
  Date: 25/05/22
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Data View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.0/css/jquery.dataTables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.0/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#example').DataTable();
        });
    </script>

    <style>
        table,thead, tr, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>

<div style="background: bisque">
    <p style="margin-left: 50%; font-size: larger; font-weight: bolder;">USER DETAILS</p>
</div>

<table id="example" class="display" style="width:50%">
    <thead>
    <tr>
        <th colspan="2">USERS DETAILS</th>
    </tr>
    <tr>
        <th>ID</th>
        <th>Name</th>
    </tr>
    </thead>
    <tbody>

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
            String s = "SELECT * FROM Users";
            PreparedStatement ps = connection.prepareStatement(s);
            ResultSet res = ps.executeQuery();
            while (res.next()) {
                int id = res.getInt("ID");
                String name = res.getString("uName");
                out.print("<tr> <td>" + id + "</td>");
                out.print("<td>" + name + "</td> </tr>");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    %>

    </tbody>

    <tfoot>
    <tr>
        <th>ID</th>
        <th>Name</th>
    </tr>
    </tfoot>

</table>
<div style="margin-left:50%">
    <a href="AdminHome.jsp" class="btn btn-primary">GO Back</a>
</div>
</body>
</html>
