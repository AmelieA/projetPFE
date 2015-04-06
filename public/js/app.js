var projetPFE;

projetPFE = angular.module('projetPFE', []).controller('particleController', [
  '$scope', '$http', function($scope, $http) {
    $http.get('/particles').success(function(data) {
      console.log(data);
      $scope.particles = data;
    });
  }
]);


