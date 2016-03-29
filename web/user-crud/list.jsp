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
    <h1>User List</h1>

<%
    UserDao dao = new UserDao();
    List<User> userList = dao.getAllUsers();
    Iterator<User> itr = userList.iterator();
    User user = null;
%>

    <table class="table">
        <tr>
            <th>Email</th>
            <th>Name</th>
            <th>Role</th>
        </tr>
        <tr>
            <%
                while(itr.hasNext()) {
                    user = itr.next();
            %>
            <td><%= user.getEmail()  %></td>
            <td><%= user.getName()  %></td>
            <td><%= user.getRole()  %></td>
            <td>
                <form method="POST" action="../UserHandler">
                    <button class="edit">Edit</button>
                    <input type="hidden" name="action" value="editForm" >
                    <input type="hidden" name="ID" value="<%= user.getId() %>" >
                </form>
            </td>
            <td>
                <form method="POST" action="../UserHandler">
                    <button class="effacer" onclick="if(!confirm('Are you sure you want to remove the user?')) return false;">Remove</button>
                    <input type="hidden" name="action" value="delete" >
                    <input type="hidden" name="ID" value="<%= user.getId() %>" >
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <a href="/user-crud/add.jsp"><input type="button" value="Add User" name="add"/></a>
</body>
</html>