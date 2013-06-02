module.exports = (grunt) ->

  grunt.initConfig

    aws: grunt.file.readJSON("aws.json")
    s3:
      options:
        key: "1NXMHSQFT0F16WRSJSR2"
        secret: "1y7pu8AEueQkRhbWAUdjHxA+3sL/ppFnO5dMka7m"
        bucket: "beaver.zeke.sikelianos.com"
        access: "public-read"

      dev:
        upload: [
          src: "dist/index.html"
          dest: "index.html"
        ,
          src: "dist/images/*"
          dest: "images/"
        ,
          src: "dist/scripts/*"
          dest: "scripts/"
        ,
          src: "dist/styles/*"
          dest: "styles/"
        ]

    compass:
      dist:
        options:
          sassDir: 'src/styles'
          cssDir: 'dist/styles'
          outputStyle: 'compact'
          relativeAssets: true
          colorOutput: false

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

  grunt.registerTask 'default', ['compass', 'coffee']
