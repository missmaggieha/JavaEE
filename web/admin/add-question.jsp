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
    <style>
        .form-controlA {
            display: inline-block;
            width: auto;
        }
    </style>
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
        <form method="POST" action="/QuestionHandler" name="add" class="form">
            <input type="hidden" name="action" value="add" />
            <h1>Add Questions</h1>
            <div class="form-group">
                <label for="question">Question</label>
                <div>
                    <input type="text" class="form-control" ng-model="question.question" name="question" id="question"  rows="3">
                </div>
            </div>
            <div class="form-group">
                <label for="explanation">Explanation</label>
                <div>
                    <textarea class="form-control" name="explanation" id="explanation" rows="3" ng-model="question.explanation"></textarea>
                </div>
            </div>


            <div class="form-group">
                <label >Difficulty</label>
                <div class="checkbox" ng-repeat="item in difficulty">
                    <label  for="difficulty">
                        <input type="checkbox" name="difficulty" value="{{item.name}}" ng-model="item.checked" ng-click="difficultySelect($index, difficulty)">
                        {{item.name}}
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label for="type">Type</label><br>
                    <select class="form-control form-controlA" name="type" id="type" ng-model="question.type" ng-change="changeType()">
                        <option ng-repeat="type in types" value="{{type.value}}">{{type.name}}</option>
                    </select>

            </div>
            <div class="form-group">
                <label>Add Answers</label>
                <div name="answer">
                    <div ng-repeat="type in types" ng-include="'views/'+ type.html" ng-show="showAnswer(type.value)"></div>
                </div>
            </div>



            <div ng-repeat="answer in question.answers">
                <p>{{answer.answer}} <a href="#" ng-click="removeAnswer(answer)" class="btn btn-danger btn-sm">X</a></p>
            </div>
            <div class="form-group">
                <div>
                    <a class="btn btn-success" ng-click="addQuestion(question)" tooltip="Super easy!" class="btn btn-success">Add</a>
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
<script src="/controllers/questions.js"></script>
<script src="/controllers/test.js"></script>
</body>
</html>