/**
 * Created by pedro on 2016-03-29.
 */
webApp.controller('TestController', ['$scope', 'Test', function($scope, Test){
    $scope.test = {};

    $scope.addTest = function() {
        Test.save($scope.test, function(resp) {
        });
    }
}]);