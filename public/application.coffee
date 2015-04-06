#angularApp = angular.module('index', [
#  'index.client.controller'
#  'ngRoute'
#  'ngResource',
#  'ngAnimate',
#  'ui.router',
#  'ui.bootstrap',
#  'ui.utils'
#]).config [
#  '$routeProvider'
#  ($routeProvider) ->
#    $routeProvider.when('/',
#      templateUrl: 'views/index.view.html'
#      controller: 'particleController')
#    return
#]


projetPFE = angular.module('projetPFE', []).controller 'particleController', [
  '$scope'
  '$http'
  ($scope, $http) ->
    $http.get('/particles').success (data) ->
      console.log data
      $scope.particles = data
      return
    return
]