# auth = require 'http-auth'

class ShussBasicAuth
  load: (@app, @express, @settings)->
    @username = @settings.get 'username'
    @password = @settings.get 'password'

    throw "No http basic auth username and password given" unless @username and @password

    @app.use @express.basicAuth @_check

  _check: (username, password, callback)=>
    username is @username and password is @password

module.exports = new ShussBasicAuth()
