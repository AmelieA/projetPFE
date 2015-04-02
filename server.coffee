###*
# Module dependencies.
###

express = require('express')
swig  = require('swig');
app = express()


###*
# Settings.
###

#all *.server.view.html will be render using swig
app.engine('server.view.html', swig.renderFile);
app.set('view engine', 'server.view.html');
#all views are on the ./app/views folder
app.set('views', './app/views');

app.use('/scripts', express.static(__dirname + '/node_modules/'));


#hardCoded
particles = [
  {
    'type': 'particles'
    'Ximpulsion': 10
    'Yimpulsion': 10
    'Zimpulsion': 10
    'Energie': 1
    'ProductionVertex': 5
    'DesintegrationVertex': 5
  }
  {
    'type': 'particles'
    'Ximpulsion': -10
    'Yimpulsion': -10
    'Zimpulsion': -10
    'Energie': -1
    'ProductionVertex': 5
    'DesintegrationVertex': 5
  }
  {
    'type': 'particles'
    'Ximpulsion': 20
    'Yimpulsion': 10
    'Zimpulsion': 10
    'Energie': 1
    'ProductionVertex': 5
    'DesintegrationVertex': 5
  }
  {
    'type': 'particles'
    'Ximpulsion': 30
    'Yimpulsion': 10
    'Zimpulsion': 10
    'Energie': 1
    'ProductionVertex': 5
    'DesintegrationVertex': 5
  }
  {
    'type': 'particles'
    'Ximpulsion': 40
    'Yimpulsion': 10
    'Zimpulsion': 10
    'Energie': 1
    'ProductionVertex': 5
    'DesintegrationVertex': 5
  }
  {
    'type': 'particles'
    'Ximpulsion': 40
    'Yimpulsion': 10
    'Zimpulsion': 10
    'Energie': 1
    'ProductionVertex': 5
    'DesintegrationVertex': 5
  }
  {
    'type': 'particles'
    'Ximpulsion': 50
    'Yimpulsion': 10
    'Zimpulsion': 10
    'Energie': 1
    'ProductionVertex': 5
    'DesintegrationVertex': 5
  }
]


#routes
app.get '/particles', (req, res) ->
  console.log 'get /particles/'
  res.json particles
  return

app.get '/particles/:id', (req, res) ->
  console.log 'get /particles/'+req.params.id
  particle = particles[req.params.id]
  res.json particle
  return

app.get '/', (req, res) ->
  console.log 'get /'
  res.render 'index',
    title:'projetPFE'
  return

server = app.listen(8080, ->
  host = server.address().address
  port = server.address().port
  console.log 'Node listening at http://%s:%s', host, port
  return
)
