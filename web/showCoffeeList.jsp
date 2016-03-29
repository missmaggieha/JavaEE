<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 24/03/16
  Time: 12:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>View Coffee List</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css" />
</head>

<body>
<h1>Coffee List View</h1>
<p>Here is the information that you retrieved from MySQL database:</p>

<table>
    <tr>
        <th>Username</th>
        <th>Password</th>
        <th>Role</th>
    </tr>
    <%
        @SuppressWarnings("unchecked")
        ArrayList<User> coffeeList = (ArrayList<User>) request
                .getAttribute("coffeeList");

        if (coffeeList != null) {
            for (User coffee : coffeeList) {
    %>
    <tr>
        <td><%=coffee.getEmail()%></td>
        <td><%=coffee.getPassword()%></td>
        <td><%=coffee.getRole()%></td>
    </tr>
    <% } } %>
</table>

<p>To return the login page, click on the Back button in your
    browser or the Return button shown below.</p>

<form action="RetrieveCoffees" method="get">
    <input type="submit" value="Return">
</form>
</body>
</html>
