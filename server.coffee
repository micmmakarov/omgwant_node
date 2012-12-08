handleRequest = (req, res) ->
  res.writeHead 200,
    "content-type": "text/plain"

  res.write "Hello world!"
  res.end()

require("http").createServer(handleRequest).listen 8080