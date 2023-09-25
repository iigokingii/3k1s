var fs = require("fs");
var index = fs.readFileSync('./index.html');
var http = require("http");

http.createServer(function (req,res){
    if(req.url=='/html'){
        res.writeHead(200, {'Content-Type': 'text/html; charset=utf8'});
        res.end(index);
    }
    else{
        res.writeHead(404, {'content-type': 'text/html'})
        res.end(`Page don't found`)
    }

}).listen(5000,'127.0.0.1');

console.log('Server running at http://127.0.0.1:5000/html')

