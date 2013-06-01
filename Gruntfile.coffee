module.exports = (grunt) ->

  # Project configuration
  grunt.initConfig

    # s3:
    #   options:
    #     key: "1NXMHSQFT0F16WRSJSR2"
    #     secret: "1y7pu8AEueQkRhbWAUdjHxA+3sL/ppFnO5dMka7m"
    #     bucket: "beaver-brook"
    #     access: "public-read"

    #   dev:
    #     upload: [
    #       src: "dist/index.html"
    #       dest: "index.html"
    #       ,
    #       src: "dist/scripts/*"
    #       dest: "scripts/"
    #     ]

    compass:
      dist:
        options:
          config: 'compass.rb'
          sassDir: 'src/styles'
          cssDir: 'dist/styles'

    coffee:
      app:
        options:
          bare: false
          join: true
        files:
          'dist/scripts/index.js': ['src/scripts/**/*.coffee']

    watch:
      coffee:
        files: ['src/scripts/**/*.coffee']
        tasks: ['coffee']
      sass:
        files: ['src/styles/*.sass']
        tasks: ['compass']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-s3'

  # Default task
  grunt.registerTask 'default', ['compass', 'coffee']
