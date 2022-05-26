<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Details</title>
    <link rel="stylesheet" href="Details.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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

<div class="container c">
    <div class="row">
        <div class="header">
            <h2>ENTER THE DETAILS</h2>
        </div>
    </div>
    <div class="row">
        <form method="post" action="GetDetails.jsp">
            <div class="row" id="no">
                <div class="col-2">Vehicle Number:</div>
                <div class="col-2"><input id="VehicleNo" type="text" placeholder="Vehicle Number" name="VehicleNo" required>
                </div>
            </div>

            <div class="footer">
                <button id="bt1" type="submit">Get Details</button>
                <a id="bt2" type="button" href="Home.jsp">Go Back</a>
            </div>
        </form>
    </div>
</div>
<hr size="5px">

<%
    if (session.getAttribute("username") == null) {
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
    response.setContentType("text/HTML");
    String Number = request.getParameter("VehicleNo");
    try {
        Class.forName("org.mariadb.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    try {
        Connection connection = DriverManager.getConnection(url, user, pass);
        PreparedStatement ps;
        ResultSet res;
        String s = "SELECT uName FROM Users";
        ps = connection.prepareStatement(s);
        res = ps.executeQuery();
        boolean Avil = false;
        while (res.next()) {
            String n = res.getString("uName");
            if (n.equals(Number)) ;
            Avil = true;
            break;
        }

        if (Avil) {
            String GetStr = "SELECT OwnerName,VehicleNumber,VehicleType,EntryTime,LotBlock FROM Parking WHERE VehicleNumber = '" + Number + "' ";
            Statement st = connection.createStatement();
            res = st.executeQuery(GetStr);
            if (res.next()) {

%>
<div class="container">
    <div class="row">
        <div class="col-6">
            <div class="col"><STRONG> PRESENT-DETAILS </STRONG></div>
            <br>
            <div class="col">OwnerName: <%=res.getString("OwnerName")%>
            </div>
            <br>
            <div class="col">VehicleNumber: <%=res.getString("VehicleNumber")%>
            </div>
            <br>
            <div class="col">VehicleType: <%=res.getString("VehicleType")%>
            </div>
            <br>
            <div class="col">EntryTime: <%=res.getString("EntryTime")%>
            </div>
            <br>
            <div class="col">Your Vehicle is Parked at: <%=res.getString("LotBlock")%>
            </div>
            <br>
            <% } else { %>
            <div class="col">VEHICLE IS NOT HERE AT THE MOMENT :</div>
            <br>
            <%}%>
        </div>

        <div class="col-6">
            <table style="width: 50%;" id="tableid" style="border: 1px solid;" class="table table-striped">
                <thead>
                <tr>
                    <th colspan="5"><STRONG> DETAILS-HISTORY </STRONG></th>
                </tr>
                <tr>
                    <th>Owner Name</th>
                    <th>Vehicle Number</th>
                    <th>Entry Time</th>
                    <th>Exit Time</th>
                </tr>
                </thead>
                <tbody>
                <%
                    String Str = "SELECT OwnerName,VehicleNumber,EntryTime,ExitTime FROM Details WHERE VehicleNumber = '" + Number + "'";
                    Statement st1 = connection.createStatement();
                    ResultSet res1 = st1.executeQuery(Str);
                    for (int i = 0; i < 25 && res1.next(); i++) {
                %>
                <tr>
                    <td><%=res1.getString("OwnerName")%>
                    </td>
                    <td><%=res1.getString("VehicleNumber")%>
                    </td>
                    <td><%=res1.getString("EntryTime")%>
                    </td>
                    <td><%=res1.getString("ExitTime")%>
                    </td>
                </tr>
                <% }
                %>
                </tbody>
                <tfoot>
                <tr>
                    <th>Owner Name</th>
                    <th>Vehicle Number</th>
                    <th>Entry Time</th>
                    <th>Exit Time</th>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>

<%
        } else {
            out.print("<h3 style=\"display:flex; justify-content:center; align-content:center; color:red\"> No User Found </h3>");
            RequestDispatcher rd = (RequestDispatcher) request.getRequestDispatcher("/GetDetails.jsp");
            try {
                rd.include((ServletRequest) request, (ServletResponse) response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>
<div class="footer">
    <a href="Home.jsp" id="ReturnOpt" class="btn btn-primary" type="button">Return To Options</a>
</div>

</body>
</html>
