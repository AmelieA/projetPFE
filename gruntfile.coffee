module.exports = (grunt) ->

  # Unified Watch Object
  watchFiles =
    serverViews: [ 'app/views/**/*.*' ]
    serverJS: [
      'gruntfile.coffee'
      'server.coffee'
      'config/**/*.coffee'
      'app/**/*.coffee'
      '!app/tests/'
    ]
    clientViews: [ 'public/modules/**/views/**/*.html' ]
    clientJS: [
      'public/js/*.js'
      'public/modules/**/*.js',
      'public/application.coffee'
    ]
    clientCSS: [ 'public/modules/**/*.css' ]


  # Project Configuration
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    watch:
      serverViews:
        files: watchFiles.serverViews
        options: livereload: true
      serverJS:
        files: watchFiles.serverJS
        tasks: [ 'jshint' ]
        options: livereload: true
      clientViews:
        files: watchFiles.clientViews
        options: livereload: true
      clientJS:
        files: watchFiles.clientJS
        tasks: [ 'jshint' ]
        options: livereload: true
      clientCSS:
        files: watchFiles.clientCSS
        tasks: [ 'csslint' ]
        options: livereload: true
    uglify: production:
      options: banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      build:
        src: 'src/<%= pkg.name %>.js'
        dest: 'build/<%= pkg.name %>.min.js'
    nodemon: dev:
      script: 'server.coffee'
      options:
        ext: 'js,html'
        watch: watchFiles.serverViews.concat(watchFiles.serverJS)


  # Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  # Default task(s).
  grunt.registerTask 'default', [ 'uglify' ]
  grunt.registerTask 'server', [ 'nodemon' ]

  return
