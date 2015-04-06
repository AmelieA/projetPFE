var projetPFE;

projetPFE = angular.module('projetPFE', []).controller('particleController', [
  '$scope', '$http', function($scope, $http) {
    $http.get('/particles').success(function(data) {
      console.log(data);
      $scope.particles = data;
      console.log($scope.particles);
    });
  }
]);

angular.module('projetPFE').controller('HeaderController', [
  '$scope', function($scope) {
    $scope.isCollapsed = false;
    $scope.menu = {};
    $scope.toggleCollapsibleMenu = function() {
      $scope.isCollapsed = !$scope.isCollapsed;
    };
    $scope.$on('$stateChangeSuccess', function() {
      $scope.isCollapsed = false;
    });
  }
]);
