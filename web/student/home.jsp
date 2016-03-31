<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="model.*" %>
<html>
<head>
    <title>Quiz App</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/assets/styles/style.css"/>
</head>
<body>
<%
    // Making sure the student user is logged in
    User user = (User)session.getAttribute("user");

    try {
        if(user.getRole() != 2) {
            response.sendRedirect("/signIn.jsp");
        }
    } catch(Exception ex) {
        response.sendRedirect("/signIn.jsp");
    }
%>
<%@include  file="navbar.html" %>
<div id="pageContent">
    <div class="container">
        <h1>Available Tests</h1>
        <%
            TestDao testDao = new TestDao();
            List<Test> testList = testDao.getAllTests();
            Iterator<Test> itr = testList.iterator();
            Test test = null;
        %>
        <div style="height: 200px; overflow: scroll">
            <table class="table bg-info table-striped">
                <tr>
                    <th>Name</th>
                    <th>Description</th>
                    <th></th>
                    <%--<th></th>--%>
                </tr>
                <tr>
                    <%
                        while(itr.hasNext()) {
                            test = itr.next();
                    %>
                    <td><%= test.getName()  %></td>
                    <td><%= test.getDescription()  %></td>
                    <td style="width: 10%">
                        <form method="POST" action="../TestHandler">
                            <button class="btn btn-primary btn-sm" tooltip="View test" ><span class="glyphicon">view</span></button>
                            <input type="hidden" name="action" value="studentView" >
                            <input type="hidden" name="ID" value="<%= test.getId() %>" >
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </div>
</div>

<script src="/assets/js/jquery-2.1.4.min.js"></script>
<script src="/assets/angular/angular.min.js"></script>
<script src="/assets/angular/angular-route.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/js/ui-bootstrap-tpls-0.13.0.min.js"></script>


<script src="/app.js"></script>
<script src="/controllers/homepage.js"></script>
<script src="/controllers/questions.js"></script>

</body>
</html>