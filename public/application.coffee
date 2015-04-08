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
    canvasXY = undefined
    context = undefined
    get = undefined
    index = undefined

    canvasXY = document.getElementById('canvasXY')
    canvasYZ = document.getElementById('canvasYZ')
    canvasZX = document.getElementById('canvasZX')
    contextXY = canvasXY.getContext('2d')
    contextYZ = canvasYZ.getContext('2d')
    contextZX = canvasZX.getContext('2d')
    canvasSize=300
    dataMagnification = 1.5
    gridSpacing = 10*dataMagnification

    drawLine = (context, xStrart, yStart, xEnd, yEnd) ->
      context.beginPath()
      context.moveTo xStrart, yStart
      context.lineTo xEnd, yEnd
      context.stroke()
      return

    drawGrid = (canvas, context)->
      canvas.width = canvasSize
      canvas.height = canvasSize
      context.beginPath()
      context.strokeStyle = 'gray'
      i = 0
      while i <= canvasSize
        context.beginPath()
        context.moveTo 0, i
        context.lineTo canvasSize, i
        context.stroke()
        i += gridSpacing

      i = 0
      while i <= canvasSize
        context.beginPath()
        context.moveTo i, 0
        context.lineTo i, canvasSize
        context.stroke()
        i += gridSpacing

      context.strokeStyle = 'red'
      context.fillRect(canvasSize/2 - 2,canvasSize/2 - 2, 4, 4);
      context.strokeStyle = 'black'
      return

    drawCurrentIndex = ->
      if $scope.particles.length == 1
        $scope.particles[index].XimpulsionSartDrawing = canvasSize/2
        $scope.particles[index].YimpulsionSartDrawing = canvasSize/2
        $scope.particles[index].ZimpulsionSartDrawing = canvasSize/2
        drawGrid(canvasXY, contextXY)
        drawGrid(canvasYZ, contextYZ)
        drawGrid(canvasZX, contextZX)
      else
        $scope.particles.forEach (particle) ->
          if $scope.particles[index].IDProductionVertex == particle.IDDesintegrationVertex
            $scope.particles[index].XimpulsionSartDrawing = particle.Ximpulsion*dataMagnification + particle.XimpulsionSartDrawing
            $scope.particles[index].YimpulsionSartDrawing = particle.Yimpulsion*dataMagnification + particle.YimpulsionSartDrawing
            $scope.particles[index].ZimpulsionSartDrawing = particle.Zimpulsion*dataMagnification + particle.ZimpulsionSartDrawing

          return
      drawLine contextXY, $scope.particles[index].XimpulsionSartDrawing, $scope.particles[index].YimpulsionSartDrawing, $scope.particles[index].XimpulsionSartDrawing + $scope.particles[index].Ximpulsion*dataMagnification, $scope.particles[index].YimpulsionSartDrawing + $scope.particles[index].Yimpulsion*dataMagnification
      drawLine contextYZ, $scope.particles[index].YimpulsionSartDrawing, $scope.particles[index].ZimpulsionSartDrawing, $scope.particles[index].YimpulsionSartDrawing + $scope.particles[index].Yimpulsion*dataMagnification, $scope.particles[index].ZimpulsionSartDrawing + $scope.particles[index].Zimpulsion*dataMagnification
      drawLine contextZX, $scope.particles[index].ZimpulsionSartDrawing, $scope.particles[index].XimpulsionSartDrawing, $scope.particles[index].ZimpulsionSartDrawing + $scope.particles[index].Zimpulsion*dataMagnification, $scope.particles[index].XimpulsionSartDrawing + $scope.particles[index].Ximpulsion*dataMagnification


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