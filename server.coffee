express = require("express")
sys = require("util")
rest = require("./node_modules/restler")

app = express.createServer(express.logger())
app.get "/", (request, response) ->
  rest.get("http://google.com").on "complete", (result) ->
  if result instanceof Error
    sys.puts "Error: " + result.message
    @retry 5000 # try again after 5 sec
  else
    sys.puts result

  response.send "OMG Hello World!"


port = process.env.PORT or 5000
app.listen port, ->
  console.log "Listening on " + port
