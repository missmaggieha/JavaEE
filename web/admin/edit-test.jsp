<!DOCTYPE html>
<%@ page import="model.Question" %>
<%@ page import="model.QuestionDao" %>
<%@ page import="java.util.*" %>
<%@ page import="model.TestDao" %>
<%@ page import="model.Test" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Quiz App</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>    
</head>
    <h1>Edit Test</h1>

<%
    TestDao testDao = new TestDao();
    int testId = Integer.parseInt((String)request.getAttribute("id"));
    Test test = testDao.getTestById(testId);
    
    // Need to create an array of answers
%>
    <form method="POST" action="TestHandler" name="edit">
        <input type="hidden" name="action" value="edit" />
        <input type="hidden" name="id" value="<%= test.getId() %>" />
        <table class="tableModifier">
			<tr>
				<td class="l">Test name : </td>
				<td class="r"><input type="text" name="name" value="<%= test.getName() %>"/></td>
			</tr>
			<tr>
				<td class="l">Test description : </td>
				<td class="r"><input type="text" name="description" value="<%= test.getDescription() %>"/></td>
			</tr>
            <%--<tr>--%>
                <%--<td class="l">Question text : </td>--%>
                <%--<td class="r"><input type="text" name="question" value="<%= question.getQuestion() %>"/></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td class="l">Explanation : </td>--%>
                <%--<td class="r"><input type="text" name="explanation" value="<%= question.getExplanation() %>"/></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
            	<%--<td class="l">Difficulty : </td>--%>
            	<%--<td class="r">--%>
            		<%--<input type="radio" name="difficulty" value="1" <% if(question.getDifficulty() == 1){ System.out.print("checked"); } %>>Easy</input>--%>
					<%--<br><input type="radio" name="difficulty" value="2" <% if(question.getDifficulty() == 2){ System.out.print("checked"); } %>>Medium</input>--%>
					<%--<br><input type="radio" name="difficulty" value="3" <% if(question.getDifficulty() == 3){ System.out.print("checked"); } %>>Hard</input>--%>
            	<%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
            	<%--<td class="l">Question Type : </td>--%>
            	<%--<td class="r">--%>
            		<%--<select name="type">--%>
						<%--<option value="1" <% if(question.getType() == 1){ System.out.print("selected"); } %>>Multiple Choice, Multiple Answer (Checkbox)</option>--%>
						<%--<option value="2" <% if(question.getType() == 2){ System.out.print("selected"); } %>>Drop Down </option>--%>
						<%--<option value="3" <% if(question.getType() == 3){ System.out.print("selected"); } %>>Multiple Choice, One Answer (Radio)</option>--%>
						<%--<option value="4" <% if(question.getType() == 4){ System.out.print("selected"); } %>>Numeric Input</option>--%>
						<%--<option value="5" <% if(question.getType() == 5){ System.out.print("selected"); } %>>Text Input</option>--%>
					<%--</select>--%>
            	<%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
            	<%--<td class="l">FOR TESTING PURPOSES, pick one below</td>--%>
            	<%--<td class="r"></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
            	<%--<td class="l">1) Answers for Multiple Choice, <br>Multiple Answer : </td>--%>
            	<%--<td class="r">--%>
            		<%--<input type="checkbox" name="is_correct1" <% if(answer[0].getIsCorrect()){ return "checked" } %>/>--%>
					<%--<input type="text" name="text1" value="<% answer[0].getText() %>"/>--%>
					<%--<br>--%>
					<%--<input type="checkbox" name="is_correct2" <% if(answer[1].getIsCorrect()){ return "checked" } %>/>--%>
					<%--<input type="text" name="text2" value="<% answer[1].getText() %>"/>--%>
					<%--<br>--%>
					<%--<input type="checkbox" name="is_correct3" <% if(answer[2].getIsCorrect()){ return "checked" } %>/>--%>
					<%--<input type="text" name="text3" value="<% answer[2].getText() %>"/>--%>
					<%--<br>--%>
					<%--<input type="checkbox" name="is_correct4" <% if(answer[3].getIsCorrect()){ return "checked" } %>/>--%>
					<%--<input type="text" name="text4" value="<% answer[3].getText() %>"/>--%>
					<%--<br>--%>
            	<%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
            	<%--<td class="l">Answers for Dropdown</td>--%>
            	<%--<td class="r">--%>
            		<%--<br><input type="radio" name="dropdownAnswer" value="is_correct1" <% if(answer[0].getIsCorrect()){ return "checked" } %>/>--%>
					<%--<input type="text" name="text1" value="<% answer[0].getText() %>"/>--%>
					<%--<br><input type="radio" name="dropdownAnswer" value="is_correct2" <% if(answer[1].getIsCorrect()){ return "checked" } %>/>--%>
					<%--<input type="text" name="text2" value="<% answer[1].getText() %>"/>--%>
					<%--<br><input type="radio" name="dropdownAnswer" value="is_correct3" <% if(answer[2].getIsCorrect()){ return "checked" } %>/>--%>
					<%--<input type="text" name="text3" value="<% answer[2].getText() %>"/>--%>
					<%--<br><input type="radio" name="dropdownAnswer" value="is_correct4" <% if(answer[3].getIsCorrect()){ return "checked" } %>/>--%>
					<%--<input type="text" name="text4" value="<% answer[3].getText() %>"/>--%>
            	<%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
            	<%--<td class="l">Answers for Multiple Choice, <br>One Answer</td>--%>
            	<%--<td class="r">--%>
            		<%--<br><input type="radio" name="radioAnswer" value="is_correct1" <% if(answer[0].getIsCorrect()){ return "checked" } %>/>--%>
					<%--<input type="text" name="text1" value="<% answer[0].getText() %>"/>--%>
					<%--<br><input type="radio" name="radioAnswer" value="is_correct2" <% if(answer[1].getIsCorrect()){ return "checked" } %>/>--%>
					<%--<input type="text" name="text2" value="<% answer[1].getText() %>"/>--%>
					<%--<br><input type="radio" name="radioAnswer" value="is_correct3" <% if(answer[2].getIsCorrect()){ return "checked" } %>/>--%>
					<%--<input type="text" name="text3" value="<% answer[2].getText() %>"/>--%>
					<%--<br><input type="radio" name="radioAnswer" value="is_correct4" <% if(answer[3].getIsCorrect()){ return "checked" } %>/>--%>
					<%--<input type="text" name="text4" value="<% answer[3].getText() %>"/>--%>
            	<%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
            	<%--<td class="l">Answer for numeric input</td>--%>
            	<%--<td class="r">--%>
            		<%--<input type="hidden" name="is_correct1" value="true"/>--%>
            		<%--<input type="text" name="text1" value="<% answer[0].getText() %>"/>--%>
            	<%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
            	<%--<td class="l">Answer for text input</td>--%>
            	<%--<td class="r">--%>
            		<%--<input type="hidden" name="is_correct1" value="true"/>--%>
            		<%--<input type="text" name="text1" value="<% answer[0].getText() %>"/>--%>
            	<%--</td>--%>
            <%--</tr>--%>
            <tr>
                <td class="l"><input type="submit" value="update" /></td>
                <td class="r"><a href="/admin/home.jsp"><input type="button" value="cancel" name="cancel"/></a></td>
            </tr>
        </table>
    </form>
</body>
</html>