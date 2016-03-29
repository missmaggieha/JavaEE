webApp.controller('QuestionsController', ['$scope', '$modal', '$location', 'Post', function($scope, $modal, $location, Post){
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
		{name: "Dropdown", value:1, html: 'dropdown.html'},
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
		$scope.question.answers.push(Object.assign({},$scope.answerTemp));
		$scope.answerTemp = {};
	}

	$scope.removeAnswer = function(item) {
		$scope.question.answers = $scope.question.answers.filter(function(answer){
			return answer.answer != item.answer;
		});
	}

	$scope.addAnswers = function() {
		Post.save($scope.question, function(resp) {
			alert(resp.data);
		});
	}
}]);