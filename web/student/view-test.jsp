<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.*" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Quiz App</title>
	<link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="/assets/styles/style.css"/>
</head>
<body>
<%@include  file="navbar.html" %>
<div id="pageContent">
	<div class="container">
<%
    TestDao testDao = new TestDao();
    int testId = Integer.parseInt((String)request.getAttribute("id"));
    Test test = testDao.getTestById(testId);
%>
		<h1><%= test.getName() %>
			<br><small><%= test.getDescription() %></small>
		</h1>
		<%
            QuestionDao questionDao = new QuestionDao();
            List<Question> questionList = questionDao.getQuestionsByTestId(test.getId());
            Iterator<Question> itr2 = questionList.iterator();
            Question question = null;
        %>
	<h3>Questions:</h3>
	<div>
		<form method="POST" action="TestHandler" name="submit">
		<input type="hidden" name="action" value="submit" />
		<input type="hidden" name="id" value="<%= test.getId() %>" />
		<table class="table bg-info table-striped">
			<tr>
				<%
					while(itr2.hasNext()) {
						question = itr2.next();

						AnswerDao answerDao = new AnswerDao();
						List<Answer> answerList = answerDao.getAnswerByQuestionId(question.getId());
						Iterator<Answer> itr3 = answerList.iterator();
						Answer answer = null;

						if(answerList.size() > 0) {
				%>
				<td>
					<h4><%= question.getQuestion() %>
						<br><small><%= question.getExplanation() %></small>
					</h4>
					<%
						if(question.getType() == 1 || question.getType() == 3) {
					%>
					<ol>
					<%
						} else if(question.getType() == 2) {
					%>
					<select name="<%= question.getId() %>">
					<%
						}
					%>
						<%
							int currentAnswer = 0;

							while(itr3.hasNext()) {
								answer = itr3.next();

								// multiple answers
								if(question.getType() == 1)
								{
						%>
								<li><input type="checkbox" name="<%= question.getId() + currentAnswer %>" value="<%= answer.getId() %>"> <%= answer.getText() %></li>
						<%
								// dropdown
								} else if(question.getType() == 2) {
						%>
								<option value="<%= answer.getId() %>"><%= answer.getText() %></option>
						<%
								// multiple choice
								} else if(question.getType() == 3) {
						%>
								<li><input type="radio" name="<%= question.getId() %>" value="<%= answer.getId() %>"> <%= answer.getText() %></li>
						<%
								// number input
								} else if(question.getType() == 4) {
						%>
								<input type="number" name="<%= question.getId() %>">
						<%
								// text input
								} else if(question.getType() == 5) {
						%>
								<input type="text" name="<%= question.getId() %>">
						<%
								}

								currentAnswer++;
							}
						%>
					<%
						if(question.getType() == 1 || question.getType() == 3) {
					%>
					</ol>
					<%
						} else if(question.getType() == 2) {
					%>
					</select>
					<%
						}
					%>
				</td>
				<%
					}
				%>
			</tr>
			<%
				}
			%>
		</table>
		<button type="submit" class="btn btn-success">Submit test</button>
		<a href="/student/home.jsp" class="btn btn-default">Cancel</a>
		</form>
	</div>
</body>
</html>