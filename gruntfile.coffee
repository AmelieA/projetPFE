module.exports = (grunt) ->

  # Unified Watch Object
  watchFiles =
    files: [
      'public/views/*.html'
      'gruntfile.coffee'
      'server.coffee'
      'public/application.coffee'
    ]


  # Project Configuration
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    uglify: production:
      options: banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      build:
        src: 'src/<%= pkg.name %>.js'
        dest: 'build/<%= pkg.name %>.min.js'
    nodemon: dev:
      script: 'server.coffee'
      options:
        ext: 'js,html,coffee'
        watch: watchFiles.files
    coffee:
      all:
        options:
          bare: true
        files: [
          src: ["./public/*.coffee", "./public/controllers/*.coffee"]
          dest: "./public/js/app.js"
        ]


  # Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  # Default task(s).
  grunt.registerTask 'uglify', [ 'uglify' ]
  grunt.registerTask 'default', [ 'coffee', 'nodemon' ]

  return
