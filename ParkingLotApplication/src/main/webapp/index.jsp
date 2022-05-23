<%--
  Created by IntelliJ IDEA.
  User: lucifer
  Date: 18/05/22
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="index.css">
    <title>INDEX</title>
</head>
<body>
<div class="header">
    <div class="row c1">
        <h1>PARKING LOT MANAGEMENT</h1>
    </div>
</div>
<div class="container">
    <div class="row c1">
        <h2>OPTIONS</h2>
    </div>
    <div class="row">

        <div class="col">
            <form method="get" action="Entry.jsp">
                <button class="btn btn-primary" id="OptEntry">CHECK-IN</button>
            </form>
        </div>

        <div class="col">
            <form method="get" action="Exit.jsp">
                <button class="btn btn-danger" id="OptExit">CHECK-OUT</button>
            </form>
        </div>

        <div class="col">
            <form method="get" action="GetDetails.jsp">
                <button class="btn btn-dark" id="OptDetails">Find My Vehicle</button>
            </form>
        </div>

        <div class="col">
            <form method="get" action="Home.jsp">
                <button class="btn btn-info">Back to HOME</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
