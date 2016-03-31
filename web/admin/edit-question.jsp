<!DOCTYPE html>
<%@ page import="model.Answer" %>
<%@ page import="model.AnswerDao" %>
<%@ page import="model.Question" %>
<%@ page import="model.QuestionDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<html id="ng-app" ng-app="WebApp">
<head>
    <meta charset="utf-8">
    <title>Quiz App</title>
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
    <script src="/assets/js/jquery-2.1.4.min.js"></script>
    <script src="/assets/angular/angular.min.js"></script>
    <script src="/assets/angular/angular-route.min.js"></script>
    <script src="/assets/angular/angular-resource.js"></script>
    <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="/assets/js/ui-bootstrap-tpls-0.13.0.min.js"></script>

    <script src="/app.js"></script>
    <script src="/controllers/questions.js"></script>
    <script src="/controllers/test.js"></script>
    <div class="container" ng-controller="QuestionsController">
        <script>
        function getAnswerValues() {
        var localAnswers = [];
        var tempAnswer={}
        <%
            QuestionDao questionDao = new QuestionDao();
            int questionId = Integer.parseInt((String)request.getAttribute("id"));
            Question question = questionDao.getQuestionById(questionId);
            AnswerDao answerDao = new AnswerDao();
            ArrayList<Answer> answers = answerDao.getAnswerByQuestionId(questionId);

            for(Iterator<Answer> i = answers.iterator(); i.hasNext();){
                Answer a = i.next();
                %>
            tempAnswer.checked = <%=a.getIs_correct()%> ;
            tempAnswer.answer = '<%=a.getText()%>' ;
            localAnswers.push(Object.assign({},tempAnswer));
            tempAnswer = {};
                <%
            }
        %>
            return localAnswers;
        };
        </script>
        <form method="POST" action="/QuestionHandler" name="add" class="form">
            <input type="hidden" name="action" value="edit" />
            <h1>Add Questions</h1>
            <div class="form-group">
                <label for="question">Question</label>
                <div>
                    <input type="text" class="form-control" ng-model="question.question" name="question" id="question"  rows="3" ng-init="question.question ='<%= question.getQuestion() %>'" value="<%= question.getExplanation() %>">
                </div>
            </div>
            <div class="form-group">
                <label for="explanation">Explanation</label>
                <div>
                    <textarea class="form-control" name="explanation" id="explanation" rows="3" ng-model="question.explanation" ng-value="question.explanation='<%= question.getExplanation() %>'"><%= question.getExplanation() %></textarea>
                </div>
            </div>


            <div class="form-group">
                <label >Difficulty</label>
                <div class="checkbox" ng-repeat="item in difficulty">
                    <label  for="difficulty">
                        <input type="checkbox" name="difficulty" value="{{item.name}}" ng-model="item.checked" ng-click="difficultySelect($index, difficulty)" ng-init="difficultySelect(<%=question.getDifficulty()%>, difficulty)">
                        {{item.name}}
                    </label>
                </div>
            </div>

            <div class="form-group" ng-init="changeType( <%=question.getType()%>)">
                <label for="type">Type</label><br>
                <select class="form-control form-controlA" name="type" id="type" ng-model="question.type" ng-change="changeType()" ng-selected="question.type">
                    <option ng-repeat="type in types" value="{{type.value}}">{{type.name}}</option>
                </select>

            </div>
            <div class="form-group" >
                <label>Add Answers</label>
                <div name="answer">
                    <div ng-repeat="type in types" ng-include="'/admin/views/'+ type.html" ng-show="showAnswer(type.value)"></div>
                </div>
            </div>


            <div ng-init="setAnswer()"></div>

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


</body>
</html>