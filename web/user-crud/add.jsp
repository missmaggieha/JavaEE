<!DOCTYPE html>
<%@ page import="model.User" %>
<%@ page import="model.UserDao" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Quiz App</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    <script src="/js/angular.min.js"></script>
    <script src="/js/app.js"></script>
</head>
<body ng-app="quizApp" ng-controller="addUserCtrl">
    <h1>Add User</h1>
    <h2>Full Name: {{name}}</h2>

    <form method="POST" action="/UserHandler" name="insert">
        <input type="hidden" name="action" value="insert" />
        <table class="tableModifier">
            <tr>
                <td class="l">Email : </td>
                <td class="r"><input type="text" name="email" placeholder="Enter email"/></td>
            </tr>
            <tr>
                <td class="l">Password : </td>
                <td class="r"><input type="password" name="password" placeholder="Enter password"/></td>
            </tr>
            <tr>
                <td class="l">Name : </td>
                <td class="r"><input type="text" name="name" placeholder="Enter name" ng-model="name"/></td>
            </tr>
            <tr>
                <td class="l">Role : </td>
                <td class="r"><input type="text" name="role" placeholder="Enter role"/></td>
            </tr>
            <tr>
                <td class="l"><input type="submit" value="Save" /></td>
                <td class="r"><a href="/user-crud/list.jsp"><input type="button" value="Cancel" name="cancel"/></a></td>
            </tr>
        </table>
    </form>
</body>
</html>