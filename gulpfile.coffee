gulp = require 'gulp'
coffee = require 'gulp-coffee'
clean = require 'gulp-clean'
cache = require 'gulp-cache'
changed = require 'gulp-changed'
connect = require 'gulp-connect'
rename = require 'gulp-rename'
replace = require 'gulp-replace'
coffeelint = require 'gulp-coffeelint'
coffee = require 'gulp-coffee'
runs = require 'run-sequence'
size = require 'gulp-size'
connect = require 'gulp-connect'

gulp.task 'default', (cb) ->
  runs ['coffee'], 'watch', cb

gulp.task 'connect:app', ->
  connect.server
    # port: 1337
    livereload: true

gulp.task 'coffee', ->
  gulp.src 'src/**/*.coffee'
    .pipe coffeelint()
    .pipe coffeelint.reporter()
    .pipe coffee bare: true
    .pipe gulp.dest 'build'
    .pipe size()
    .pipe connect.reload()

gulp.task 'watch', ['connect:app'], ->
  gulp.watch 'src/**/*.coffee', ['coffee']

