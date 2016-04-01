webApp.controller('QuestionsController', ['$scope','$http', '$modal', '$location', function($scope,$http,  $modal, $location){

	$scope.title = "Quiz App";
	$scope.question = {
		question: '',
		explanation: '',
		difficulty: 0,
		type: 0,
		answers: [],
		answersString: []
	}

	$scope.answerTemp = {checked: undefined, answer: ''};

	$scope.types = [
		{name: "Checkbox", value:0, html: 'checkbox.html'},
		{name: "Dropdown", value:1, html: 'checkbox.html'},
		{name: "Multiple Choice", value:2, html: 'checkbox.html'},
		{name: "Numeric Input", value:3, html: 'numeric.html'},
		{name: "Text Input", value:4, html: 'text.html'}
	];

	$scope.difficulty = [
		{name: "Easy", value:0, checked: true},
		{name: "Medium", value:1, checked: false},
		{name: "Hard", value:2, checked: false}
	];

	$scope.difficultySelect = function(index, group) {
		group.forEach(function(element, i){
			element.checked = (element.value == index);
		});
		$scope.question.difficulty = index;
	}
	$scope.showAnswer = function(value) {
		if($scope.question.type == value)
			return true;
		else
			return false;
	}

	$scope.setAnswer = function() {
		$scope.question.answers = getAnswerValues();
	}
	$scope.changeType = function (value) {
		$scope.question.answers = [];
		if(value)
			$scope.question.type = Number(value);
		else
			$scope.question.type = Number($scope.question.type);


	}

	$scope.addAnswer = function() {
		if($scope.question.type < 3 && $scope.answerTemp.checked == undefined){
			$scope.answerTemp.checked = false;
		}
		else if ($scope.answerTemp.type >= 3) {
			$scope.answerTemp.checked = true;
		}
		if($scope.question.type == 3 && isNaN($scope.answerTemp.answer) ){
			$scope.errorMsg = "This is not a number.";
			return;

		}
		$scope.question.answers.push(Object.assign({},$scope.answerTemp));
		var stringAnswer = JSON.stringify(JSON.stringify($scope.answerTemp));
		//$scope.question.answersString.push(stringAnswer.slice(1, stringAnswer.length - 1));
		$scope.question.answersString.push(JSON.stringify($scope.answerTemp));


		$scope.answerTemp = {};
	}

	$scope.removeAnswer = function(item) {
		$scope.question.answers = $scope.question.answers.filter(function(answer){
			return answer.answer != item.answer;
		});
	}
	$scope.addQuestion = function(question) {
		var data = $.param({
			action: 'add',
			question: question.question,
			explanation: question.explanation,
			difficulty: question.difficulty.toString(),
			type: question.type.toString(),
			"answers[]": question.answersString
		});

		$http({
			method: 'POST',
			url: '/QuestionHandler',
			data: data,
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
			}}).then(function(result) {
			console.log(result);
			window.location.href = "/admin/home.jsp";
		}, function(error) {
			console.log(error);
		});


	};

}]);