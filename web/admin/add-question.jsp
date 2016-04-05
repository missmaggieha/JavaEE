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
<%@include  file="navbar.html" %>

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
                <select class="form-control form-controlA" ng-model="selectedType" ng-options="t as t.name for t in types" ng-change="changeType()"></select>
            </div>
            <div class="form-group">
                <label>Add Answers</label>
                <div name="answer">
                    <div ng-repeat="type in types" ng-include="'views/'+ type.html" ng-show="showAnswer(type.value)"></div>
                </div>
            </div>



            <div class="panel panel-default form-controlA">
                <div class="panel-heading">
                    <h3 class="panel-title">Answers</h3>
                </div>
                <div class="panel-body">
                    <div ng-repeat="answer in question.answers" >
                        <button class="btn btn-primary" type="button">
                            <span class="badge">{{answer.checked}}</span>&nbsp;{{answer.answer}}
                        </button>
                        <a href="#" ng-click="removeAnswer(answer)" class="btn btn-danger btn-sm">X</a>
                    </div>
                </div>
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