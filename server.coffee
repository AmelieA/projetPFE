###*
# Module dependencies.
###

addon = require('albers-core-module')
express = require('express')
swig  = require('swig')
app = express()


# Settings.

#all *.server.view.html will be render using swig
app.engine('view.html', swig.renderFile);
app.set('view engine', 'view.html');
#differentiate between injection fro swig ([[ ]]) and angular ({{ }})
swig.setDefaults({ varControls: ['[[', ']]'] });
#all views are on the ./app/views folder
app.set('views', './public/views');
#Static routes
app.use('/lib', express.static(__dirname + '/node_modules'));
app.use("/public", express.static(__dirname + '/public'));


#hardCoded
particles = [
  {
    'type': 'particles'
    'impulsions': [
      {
        'px': 0
        'py': 10
        'pz': 10
      }
    ]
    'Ximpulsion': 0
    'Yimpulsion': 10
    'Zimpulsion': 10
    'Energie': 1
    'IDProductionVertex': 0
    'IDDesintegrationVertex': 1
  }
  {
    'type': 'particles'
    'Ximpulsion': 10
    'Yimpulsion': 0
    'Zimpulsion': 10
    'Energie': -1
    'IDProductionVertex': 1
    'IDDesintegrationVertex': 2
  }
  {
    'type': 'particles'
    'Ximpulsion': 0
    'Yimpulsion': 20
    'Zimpulsion': 10
    'Energie': 1
    'IDProductionVertex': 2
    'IDDesintegrationVertex': 3
  }
  {
    'type': 'particles'
    'Ximpulsion': 20
    'Yimpulsion': 0
    'Zimpulsion': 10
    'Energie': 1
    'IDProductionVertex': 2
    'IDDesintegrationVertex': 4
  }
  {
    'type': 'particles'
    'Ximpulsion': 0
    'Yimpulsion': 30
    'Zimpulsion': 10
    'Energie': 1
    'IDProductionVertex': 3
    'IDDesintegrationVertex': 5
  }
  {
    'type': 'particles'
    'Ximpulsion': 30
    'Yimpulsion': 0
    'Zimpulsion': 10
    'Energie': 1
    'IDProductionVertex': 4
    'IDDesintegrationVertex': 6
  }
  {
    'type': 'particles'
    'Ximpulsion': 0
    'Yimpulsion': 40
    'Zimpulsion': 10
    'Energie': 1
    'IDProductionVertex': 4
    'IDDesintegrationVertex': 7
  }
]
vertices = [
  {
    'id': 0
    'Xpos':0
    'Ypos':0
    'Ypos':0
  },
  {
    'id': 1
    'Xpos':10
    'Ypos':0
    'Ypos':0
  },
  {
    'id': 2
    'Xpos':10
    'Ypos':10
    'Ypos':0
  },
  {
    'id': 3
    'Xpos':10
    'Ypos':10
    'Ypos':10
  },
  {
    'id': 4
    'Xpos':10
    'Ypos':10
    'Ypos':20
  },
  {
    'id': 5
    'Xpos':10
    'Ypos':20
    'Ypos':20
  },
  {
    'id': 6
    'Xpos':20
    'Ypos':20
    'Ypos':20
  },
  {
    'id': 7
    'Xpos':30
    'Ypos':20
    'Ypos':20
  },
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

app.get '/verticles', (req, res) ->
  console.log 'get /verticles/'
  res.json particles
  return

app.get '/verticles/:id', (req, res) ->
  console.log 'get /verticles/'+req.params.id
  vertices.forEach (vertex)->
    if vertex.id == req.params.id
      res.json vertex
    return
  return

app.get '/', (req, res) ->
  console.log 'get /'
  res.render 'index',
    title:'projetPFE'
  return


#source /home/amelie/Desktop/root/bin/thisroot.sh
#source /home/amelie/workspace/albers-core-module/deps/init_linux.sh
console.log(addon.getProduct(1))
console.log(addon.getProduct(4))

server = app.listen(8080, ->
  host = server.address().address
  port = server.address().port
  console.log 'Node listening at http://%s:%s', host, port
  return
)
