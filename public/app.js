webApp = angular.module('WebApp', ['ngRoute', 'ui.bootstrap', 'ngResource']);

webApp.config(['$routeProvider', function($routeProvider) {
	$routeProvider.
		when('/about', {
			templateUrl: '/views/about.html',
			controller: function(){}
		}).
		otherwise({
			templateUrl: '/views/questions.html',
			controller: 'QuestionsController'
		});
}]);

webApp.directive('ngEnter', function () {
    return function (scope, element, attrs) {
        element.bind("keydown keypress", function (event) {
            if(event.which === 13) {
                scope.$apply(function (){
                    scope.$eval(attrs.ngEnter);
                });

                event.preventDefault();
            }
        });
    };
});

webApp.factory("Post", function($resource) {
  return $resource("http://httpbin.org/post");
});