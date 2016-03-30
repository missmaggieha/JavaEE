<%--
  Created by IntelliJ IDEA.
  User: pedro
  Date: 2016-03-29
  Time: 7:59 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page import="model.Question" %>
<%@ page import="model.QuestionDao" %>
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
    <div class="container" ng-controller="QuestionsController">
        <form method="POST" action="/QuestionHandler" name="add" class="form-horizontal">
            <input type="hidden" name="action" value="add" />
            <h1>Add Questions</h1>
            <div class="form-group">
                <label for="question" class="col-sm-2 control-label">Question</label>
                <div class="col-sm-10">
                    <textarea ng-model="question.question" name="question" id="question" cols="50" rows="5"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="explanation" class="col-sm-2 control-label">Explanation</label>
                <div class="col-sm-10">
                    <textarea name="explanation" id="explanation" cols="50" rows="5" ng-model="question.explanation"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-success">Add</button>
                    <a href="/admin/home.jsp" class="btn btn-default">Cancel</a>
                </div>
            </div>

            <br/>
            <label for="question">Question:</label>
            <br/>
            <br/>
            <label for="explanation">Explanation:</label>
            <br/>
            <br/>
            <label for="difficulty">Difficulty:</label>
            <br/>
            <label ng-repeat="item in difficulty" for="difficulty">
                <input type="checkbox" name="difficulty" value="item.name" ng-model="item.checked" ng-click="difficultySelect($index, difficulty)">{{item.name}}
            </label>
            <br/>
            <label for="type">Type:</label>
            <br/>
            <select name="type" id="type" ng-model="question.type" ng-change="changeType()">
                <option ng-repeat="type in types" value="{{type.value}}">{{type.name}}</option>
            </select>
            <br/>
            <div name="answer">
                <div ng-repeat="type in types" ng-include="'views/'+ type.html" ng-show="showAnswer(type.value)"></div>
            </div>
            <div ng-repeat="answer in question.answers">
                <p>{{answer.answer}} <a href="#" ng-click="removeAnswer(answer)" class="btn btn-danger btn-sm">X</a></p>
            </div>
            <a href="#" class="btn btn-success" ng-click="addAnswers()" tooltip="Super easy!">Add Answer</a>
            <h1>{{question}}</h1>

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
<script src="/controllers/questions.js"></script>
<script src="/controllers/test.js"></script>
</body>
</html>