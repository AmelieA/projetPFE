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
      $scope.particles = data
      console.log $scope.particles
      return
    return
]

angular.module('projetPFE').controller 'HeaderController', [
  '$scope'
  ($scope) ->
    $scope.isCollapsed = false
    $scope.menu = {}

    $scope.toggleCollapsibleMenu = ->
      $scope.isCollapsed = !$scope.isCollapsed
      return

    # Collapsing the menu after navigation
    $scope.$on '$stateChangeSuccess', ->
      $scope.isCollapsed = false
      return
    return
]