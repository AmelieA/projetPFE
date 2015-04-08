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


projetPFE = angular.module('projetPFE', []).controller('particleController', [
  '$scope'
  '$http'
  ($scope, $http) ->
    canvas = undefined
    context = undefined
    get = undefined
    index = undefined

    canvas = document.getElementById('canvas')
    context = canvas.getContext('2d')
    canvas.width = 300
    canvas.height = 300
    context.globalAlpha = 1.0
    context.beginPath()
    gridSpacing = 50
    dataMagnification = 1.5

    drawLine = (xStrart, yStart, xEnd, yEnd) ->
      context.beginPath()
      context.moveTo xStrart, yStart
      context.lineTo xEnd, yEnd
      context.strokeStyle = 'black'
      context.stroke()
      return

    drawGrid = ->
      context.strokeStyle = 'gray'
      i = 0
      while i <= canvas.height
        context.beginPath()
        context.moveTo 0, i
        context.lineTo canvas.width, i
        context.stroke()
        i += gridSpacing

      i = 0
      while i <= canvas.width
        context.beginPath()
        context.moveTo i, 0
        context.lineTo i, canvas.height
        context.stroke()
        i += gridSpacing
      return

    drawCurrentIndex = ->
      if $scope.particles.length == 1
        $scope.particles[index].XimpulsionSartDrawing = canvas.width/2
        $scope.particles[index].YimpulsionSartDrawing = canvas.height/2
        drawGrid()
        drawLine canvas.width/2, canvas.height/2, canvas.width/2 + $scope.particles[index].Ximpulsion*2, canvas.height/2 + $scope.particles[index].Yimpulsion*2
      else
        $scope.particles.forEach (particle) ->
          if $scope.particles[index].IDProductionVertex == particle.IDDesintegrationVertex
            $scope.particles[index].XimpulsionSartDrawing = particle.Ximpulsion*dataMagnification + particle.XimpulsionSartDrawing
            $scope.particles[index].YimpulsionSartDrawing = particle.Yimpulsion*dataMagnification + particle.YimpulsionSartDrawing
            drawLine $scope.particles[index].XimpulsionSartDrawing, $scope.particles[index].YimpulsionSartDrawing, $scope.particles[index].XimpulsionSartDrawing + $scope.particles[index].Ximpulsion*dataMagnification, $scope.particles[index].YimpulsionSartDrawing + $scope.particles[index].Yimpulsion*dataMagnification
          return
      return

    $scope.particles = []

    get = (index) ->
      $http.get('/particles/' + index).success (data) ->
        if !$scope.particles[0]
          $scope.particles = [ data ]
        else
          $scope.particles.push data
        drawCurrentIndex()
        console.log $scope.particles
        return
      return

    $scope.init = ->
      if !$scope.localIndex
        index = 0
      else
        index = $scope.localIndex
        $scope.particles = []
      get index
      return

    $scope.getNext = ->
      index++
      get index
      return

    $scope.init()
    return
])