<!DOCTYPE html>
<%@ page import="model.User" %>
<%@ page import="model.UserDao" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Quiz App</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>    
</head>
    <h1>Edit User</h1>

<%
    UserDao dao = new UserDao();
    int userId = Integer.parseInt((String)request.getAttribute("id"));
    User user = (User)dao.getUserById(userId);
%>
    <form method="POST" action="UserHandler" name="edit">
        <input type="hidden" name="action" value="edit" />
        <input type="hidden" name="id" value="<%= user.getId() %>" />
        <table class="tableModifier">
            <tr>
                <td class="l">Email : </td>
                <td class="r"><input type="text" name="email" value="<%= user.getEmail() %>"/></td>
            </tr>
            <tr>
                <td class="l">Name : </td>
                <td class="r"><input type="text" name="name" value="<%= user.getName() %>"/></td>
            </tr>
            <tr>
                <td class="l">Role : </td>
                <td class="r"><input type="text" name="role" value="<%= user.getRole() %>"/></td>
            </tr>
            <tr>
                <td class="l"><input type="submit" value="update" /></td>
                <td class="r"><a href="/user-crud/list.jsp"><input type="button" value="cancel" name="cancel"/></a></td>
            </tr>
        </table>
    </form>
</body>
</html>