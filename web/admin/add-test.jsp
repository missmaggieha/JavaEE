<!DOCTYPE html>
<%@ page import="model.Test" %>
<%@ page import="model.TestDao" %>
<%@ page import="java.util.*" %>
<html id="ng-app" ng-app="WebApp">
<head>
    <title>Angular Bootstrap Boilerplate</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/assets/styles/style.css"/>
</head>
<body>

<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#/">Angular Bootstrap Boilerplate</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse navbar-right">
            <ul class="nav navbar-nav">
                <li><a href="#/">Home</a></li>
                <li><a href="#/about">About</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div id="pageContent">
    <div class="container">
        <form method="POST" action="/TestHandler" name="add" class="form-horizontal">
            <input type="hidden" name="action" value="add" />

            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter name">
                </div>
            </div>
            <div class="form-group">
                <label for="description" class="col-sm-2 control-label">Description</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="description" name="description" placeholder="Enter description">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-success">Add</button>
                    <a href="/admin/home.jsp" class="btn btn-default">Cancel</a>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="/assets/js/jquery-2.1.4.min.js"></script>
<script src="/assets/angular/angular.min.js"></script>
<script src="/assets/angular/angular-route.min.js"></script>
<script src="/assets/angular/angular-resource.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/js/ui-bootstrap-tpls-0.13.0.min.js"></script>

<script src="/app.js"></script>
<script src="/controllers/homepage.js"></script>
<script src="/controllers/questions.js"></script>
<script src="/controllers/test.js"></script>
</body>
</html>