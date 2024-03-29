// Generated by CoffeeScript 1.4.0
(function() {
  var app, express, port, rest, sys;

  express = require("express");

  sys = require("util");

  rest = require("./node_modules/restler");

  app = express.createServer(express.logger());

  app.get("/", function(request, response) {
    var callback_string, search_string;
    response.writeHead(200, {
      'content-type': 'plain/text',
      'Accept': '*/*'
    });
    search_string = request.query.search;
    callback_string = request.query.callback;
    return rest.get("http://api.shopstyle.com/action/apiSearch?pid=uid7444-8563962-34&fts=" + search_string + "&min=0&count=6&format=json").on("complete", function(result) {
      if (result instanceof Error) {
        sys.puts("Error: " + result.message);
        return this.retry(5000);
      } else {
        response.write("" + callback_string + "(" + result + ");");
        return response.end();
      }
    });
  });

  app.get("/system/:id", function(request, response) {
    var id;
    id = request.params.id;
    return response.send("OMG Hello World hahaha!");
  });

  port = process.env.PORT || 5000;

  app.listen(port, function() {
    return console.log("Listening on " + port);
  });

}).call(this);
