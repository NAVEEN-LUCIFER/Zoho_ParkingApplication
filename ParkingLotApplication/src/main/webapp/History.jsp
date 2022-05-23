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
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tableid').DataTable();
        });
    </script>
</head>
<body>
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
        <div class="col-6">
            <table style="width: 50%;" id="tableid" style="border: 1px solid;" class="table table-striped">
                <tr>
                    <thead><STRONG> Lot-History </STRONG></thead>
                </tr>
                <tr>
                    <th>OwnerName</th>
                    <th>Vehicle Number</th>
                    <th>Entry Time</th>
                    <th>Lot Block</th>
                </tr>
                <% String Str = "SELECT OwnerName,VehicleNumber,EntryTime,LotBlock FROM Parking WHERE VehicleNumber IS NOT NULL";
                    Statement st1 = connection.createStatement();
                    ResultSet res1 = st1.executeQuery(Str);
                    for (int i = 0; i < 25 && res1.next(); i++) {
                        String Name, No, Ty, LB;
                %>
                <tr>
                    <td><%=res1.getString("OwnerName")%></td>
                    <td><%=res1.getString("VehicleNumber")%></td>
                    <td><%=res1.getString("EntryTime")%></td>
                    <td><%=res1.getString("LotBlock")%></td>
                </tr>
                <%     }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                %>
            </table>
        </div>
<div class="footer">
    <a href="Home.jsp" id="ReturnOpt" class="btn btn-primary" type="button">Return To Options</a>
</div>
</body>
</html>
