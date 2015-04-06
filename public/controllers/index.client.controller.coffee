#angularApp.module('index.client.controller').controller 'particleController', [
#  '$scope'
#  ($scope) ->
#
#    $scope.particle=Particules.getParticles;
#
#    $scope.getParticles = ($scope, $http) ->
#      console.log("getting particles on client side")
#      $http.get('/particles').success((data) ->
#        $scope.particles = data
#        return
#      ).error (data) ->
#        console.log 'Error: ' + data
#        return
#      return
#
#    return
#]