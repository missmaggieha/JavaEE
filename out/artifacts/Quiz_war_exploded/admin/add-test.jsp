<!DOCTYPE html>
<%@ page import="model.Test" %>
<%@ page import="model.TestDao" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Quiz App</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>    
</head>
    <h1>Add Test</h1>

    <form method="POST" action="/TestHandler" name="add">
        <input type="hidden" name="action" value="add" />
        <%--<input type="hidden" name="id" value="<%= test.getId() %>" />--%>
        <table class="tableModifier">
            <tr>
                <td class="l">Test Name : </td>
                <td class="r"><input type="text" name="name" placeholder="Enter name"/></td>
            </tr>
            <tr>
                <td class="l">Description : </td>
                <td class="r"><input type="text" name="description" placeholder="Enter description"/></td>
            </tr>
            <tr>
                <td class="l"><input type="submit" value="Save" /></td>
                <td class="r"><a href="/admin/home.jsp"><input type="button" value="Cancel" name="cancel"/></a></td>
            </tr>
        </table>
    </form>
</body>
</html>