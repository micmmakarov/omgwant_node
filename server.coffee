express = require("express")
sys = require("util")
rest = require("./node_modules/restler")

app = express.createServer(express.logger())
app.get "/", (request, response) ->
  response.writeHead(200, {'content-type':'application/json'})
  #, 'charset':'charset=utf-8'
  #response.send "OMG Hello World!#{request.query.search}"
  search_string = request.query.search
  rest.get("http://api.shopstyle.com/action/apiSearch?pid=uid7444-8563962-34&fts=#{search_string}&min=0&count=30&format=json").on "complete", (result) ->
    if result instanceof Error
      sys.puts "Error: " + result.message
      @retry 5000 # try again after 5 sec
    else
      response.write result
      response.end()

app.get "/system/:id", (request, response) ->
  id = request.params.id

  response.send "OMG Hello World hahaha!"


port = process.env.PORT or 5000
app.listen port, ->
  console.log "Listening on " + port
