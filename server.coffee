express = require("express")
app = express.createServer(express.logger())
app.get "/", (request, response) ->
  response.send "OMG Hello World!"

port = process.env.PORT or 5000
app.listen port, ->
  console.log "Listening on " + port
