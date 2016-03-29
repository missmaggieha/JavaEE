<!DOCTYPE html>
<%@ page import="model.Test" %>
<%@ page import="model.TestDao" %>
<%@ page import="java.util.*" %>
<%@ page import="model.QuestionDao" %>
<%@ page import="model.Question" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Quiz App</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
    <h1>Tests List</h1>
<%
    TestDao testDao = new TestDao();
    List<Test> testList = testDao.getAllTests();
    Iterator<Test> itr = testList.iterator();
    Test test = null;
%>

    <table class="table">
        <tr>
            <th>Name</th>
            <th>Description</th>
        </tr>
        <tr>
            <%
                while(itr.hasNext()) {
                    test = itr.next();
            %>
            <td><%= test.getName()  %></td>
            <td><%= test.getDescription()  %></td>
            <td>
                <form method="POST" action="../TestHandler">
                    <button class="edit">Edit</button>
                    <input type="hidden" name="action" value="editForm" >
                    <input type="hidden" name="ID" value="<%= test.getId() %>" >
                </form>
            </td>
            <td>
                <form method="POST" action="../TestHandler">
                    <button onclick="if(!confirm('Are you sure you want to remove the test?')) return false;">Remove</button>
                    <input type="hidden" name="action" value="delete" >
                    <input type="hidden" name="ID" value="<%= test.getId() %>" >
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <a href="/admin/add-test.jsp"><input type="button" value="Add Test" name="add"/></a>
<br>
    <%
        QuestionDao questionDao = new QuestionDao();
        List<Question> questionList = questionDao.getAllQuestions();
        Iterator<Question> itr2 = questionList.iterator();
        Question question = null;
    %>
    <h1>Questions List</h1>
    <table class="table">
        <tr>
            <th>Question</th>
        </tr>
        <tr>
            <%
                while(itr2.hasNext()) {
                    question = itr2.next();
            %>
            <td><%= question.getQuestion()  %></td>
            <td>
                <form method="POST" action="../QuestionHandler">
                    <button class="edit">Edit</button>
                    <input type="hidden" name="action" value="editForm" >
                    <input type="hidden" name="ID" value="<%= question.getId() %>" >
                </form>
            </td>
            <td>
                <form method="POST" action="../QuestionHandler">
                    <button onclick="if(!confirm('Are you sure you want to remove the question?')) return false;">Remove</button>
                    <input type="hidden" name="action" value="delete" >
                    <input type="hidden" name="ID" value="<%= question.getId() %>" >
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <a href="/admin/add-question.jsp"><input type="button" value="Add Question" name="add"/></a>
</body>
</html>