time = require 'time-grunt'
jit = require 'jit-grunt'
autoprefixer = require 'autoprefixer'
cssVariables = require 'postcss-css-variables'
calc = require 'postcss-calc'

config =
    exec: 
        'harp': 'harp compile'
    'gh-pages':
        main:
            options:
                base: 'www'
            src: '**/*'
    postcss:
        options:
            processors: [autoprefixer({browers: 'last 2 versions'}), cssVariables, calc]
        dist:
            src: 'www/styles/styles.css'
    copy:
        main:
            src: ['CNAME', 'images/*.*', 'scripts/*.js']
            expand: true
            dest: 'www/'  
    coffee:
        main:
            expand: true
            flatten: true
            ext: '.js'
            src: 'scripts/*.coffee'
            dest: 'www/scripts/'
     
    stylus:
        main:
            src: 'styles/styles.styl'
            dest: 'www/styles/styles.css'
    yaml:
        main:
            expand: true
            src: ['**/_harp.yml', '**/_data.yml']
            ext: '.json'
    watch:
        options:
            livereload: true
        yaml:
            files: ['**/*.yml']
            tasks: ['yaml']
        all:
            files: ['**/*.*']
            tasks: []

module.exports = (grunt) ->
    grunt.initConfig config
    time grunt
    jit grunt
    grunt.registerTask 'default', ['yaml', 'watch']
    grunt.registerTask 'compile', ['yaml','force:on', 'exec:harp','force:off', 'copy', 'stylus', 'postcss', 'coffee']
    grunt.registerTask 'deploy', ['compile','gh-pages']
