<!DOCTYPE html>
<%@ page import="model.Test" %>
<%@ page import="model.TestDao" %>
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
    <form method="POST" action="TestHandler" name="edit">
        <input type="hidden" name="action" value="edit" />
        <input type="hidden" name="id" value="<%= test.getId() %>" />
        <table class="table">
			<%--<tr>--%>
				<%--<td class="l">Test name : </td>--%>
				<%--<td class="r"><input type="text" name="name" value="<%= test.getName() %>"/></td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
				<%--<td class="l">Test description : </td>--%>
				<%--<td class="r"><input type="text" name="description" value="<%= test.getDescription() %>"/></td>--%>
			<%--</tr>--%>
            <%--<tr>--%>
                <%--<td class="l"><input type="submit" value="update" /></td>--%>
                <%--<td class="r"><a href="/admin/home.jsp"><input type="button" value="cancel" name="cancel"/></a></td>--%>
            <%--</tr>--%>
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">Test name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="name" name="name" placeholder="Enter test name" value="<%= test.getName() %>">
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-2 control-label">Description</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="description" name="description" placeholder="Enter description" value="<%= test.getDescription() %>">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-success">Update</button>
					<a href="/admin/home.jsp" class="btn btn-default">Cancel</a>
				</div>
			</div>
        </table>
    </form>
</body>
</html>