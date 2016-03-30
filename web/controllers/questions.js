webApp.controller('QuestionsController', ['$scope', '$modal', '$location', function($scope, $modal, $location){

	$scope.title = "Quiz App";
	$scope.question = {
		question: '',
		explanation: '',
		difficulty: 0,
		type: 0,
		answers: []
	}

	$scope.answerTemp = {};

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

	$scope.changeType = function () {
		$scope.question.answers = [];
		$scope.question.type = Number($scope.question.type)
	}

	$scope.addAnswer = function() {
		if($scope.question.type < 3 && $scope.answerTemp.checked == undefined){
			$scope.answerTemp.checked = false;
		}
		if($scope.question.type == 3 && isNaN($scope.answerTemp.answer) ){
			$scope.errorMsg = "This is not a number."
			return;

		}
		$scope.question.answers.push(Object.assign({},$scope.answerTemp));
		$scope.answerTemp = {};
	}

	$scope.removeAnswer = function(item) {
		$scope.question.answers = $scope.question.answers.filter(function(answer){
			return answer.answer != item.answer;
		});
	}
}]);