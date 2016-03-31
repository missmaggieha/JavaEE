<!DOCTYPE html>
<%@ page import="model.Test" %>
<%@ page import="model.TestDao" %>
<%@ page import="java.util.*" %>
<%@ page import="model.QuestionDao" %>
<%@ page import="model.Question" %>
<html id="ng-app" ng-app="WebApp">
<head>
    <title>{{title}}</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/assets/styles/style.css"/>
</head>
<body>

<%@include  file="navbar.html" %>

<div id="pageContent">
    <div class="container">
        <table class="table">
            <tr>
                <th><h1>Tests</h1></th>
                <th style="width: 10%">
                    <h1><a href="/admin/add-test.jsp" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span></a></h1>
                </th>
            </tr>
        </table>
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
                    <th></th>
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
                            <button class="btn btn-primary btn-sm" tooltip="Edit" ><span class="glyphicon glyphicon-pencil"></span></button>
                            <input type="hidden" name="action" value="editForm" >
                            <input type="hidden" name="ID" value="<%= test.getId() %>" >
                        </form>
                    </td>
                    <td style="width: 10%">
                        <form method="POST" action="../TestHandler">
                            <button onclick="if(!confirm('Are you sure you want to remove the test?')) return false;" tooltip="Remove" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-remove"></span></button>
                            <input type="hidden" name="action" value="delete" >
                            <input type="hidden" name="ID" value="<%= test.getId() %>" >
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <%
            QuestionDao questionDao = new QuestionDao();
            List<Question> questionList = questionDao.getAllQuestions();
            Iterator<Question> itr2 = questionList.iterator();
            Question question = null;
        %>
        <table class="table">
            <tr>
                <th><h1>Questions</h1></th>
                <th style="width: 10%">
                    <h1><a href="/admin/add-question.jsp" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span></a></h1>
                </th>
            </tr>
        </table>

        <div style="height: 200px; overflow: scroll">
            <table class="table bg-info table-striped">
                <tr>
                    <%
                        while(itr2.hasNext()) {
                            question = itr2.next();
                    %>
                    <td><%= question.getQuestion()  %></td style="width: 80%">
                    <td style="width: 10%">
                        <form method="POST" action="../QuestionHandler">
                            <button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil"></span></button>
                            <input type="hidden" name="action" value="editForm" >
                            <input type="hidden" name="ID" value="<%= question.getId() %>" >
                        </form>
                    </td>
                    <td style="width: 10%">
                        <form method="POST" action="../QuestionHandler">
                            <button onclick="if(!confirm('Are you sure you want to remove the question?')) return false;" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-remove"></span></button>
                            <input type="hidden" name="action" value="delete" >
                            <input type="hidden" name="ID" value="<%= question.getId() %>" >
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <div ng-view></div>
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