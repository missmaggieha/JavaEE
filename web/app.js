webApp = angular.module('WebApp', ['ui.bootstrap', 'ngResource']);


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

webApp.factory("Test", function($resource) {
  return $resource("/TestHandler");
});