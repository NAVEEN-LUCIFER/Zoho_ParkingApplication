<%--
  Created by IntelliJ IDEA.
  User: lucifer
  Date: 26/05/22
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Data Updation</title>
    <link rel="stylesheet" href="Update.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script type="text/javascript">
        function EnableDisableName(ch) {
            const txt = document.getElementById("txtName");
            txt.disabled = !ch.checked;
            if (!txt.disabled) {
                txt.focus();
            }
        }

        function EnableDisableAge(ch) {
            const txt = document.getElementById("txtAge");
            txt.disabled = !ch.checked;
            if (!txt.disabled) {
                txt.focus();
            }
        }
    </script>
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

<form action="ServletAdminEditUser" method="post">
    <div style="background: coral">
        <p style="margin-left: 50%">
            UPDATE USER DETAILS
        </p>
    </div>
    <table>
        <tr>
            <td>CHECK WHAT TO UPDATE</td>
        </tr>
        <tr>
            <td><label>User Name</label></td>
            <td><label><input name="id" id="txtId" type="text" placeholder="UserName" required></label></td>
        </tr>
        <tr>
            <td><label><input name="check" id="name" type="checkbox" onclick="EnableDisableName(this)" /> User Name</label></td>
            <td><label><input name="name" id="txtName" type="text" placeholder="Name" disabled="disabled"></label></td>
        </tr>
        <tr>
            <td><label><input id="age" type="checkbox" onclick="EnableDisableAge(this)"/> Password</label></td>
            <td><label><input name="pass" id="txtAge" type="text" placeholder="Password" disabled="disabled"></label></td>
        </tr>
        <tr>
            <td><a href="AdminHome.jsp" class="btn btn-danger" id="bac" type="button">Back</a></td>
            <td><button class="btn btn-success" id="sub" type="submit" name="update">Update</button></td>
            <td><button class="btn btn-warning" id="del" type="submit" name="delete">Delete</button></td>
        </tr>
    </table>
</form>
</body>
</html>
