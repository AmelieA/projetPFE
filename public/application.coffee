angular.module('Home', [
  'ngResource',
  'ngAnimate',
  'ui.router',
  'ui.bootstrap',
  'ui.utils'
]).config ($routeProvider) ->
  $routeProvider.when('/',
    templateUrl: 'views/home'
    controller: 'Home')
  return

angular.module('Home').controller 'Home', ($scope, $routeParams, serviceAjax) ->
  Console.log("Home")
  $scope.particle= ->
    $http.get('/particles', particles)
    return
