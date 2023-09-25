var fs = require("fs");
var index = fs.readFileSync('./index.html');
var http = require("http");

http.createServer(function (req,res){
    if(req.url=='/api/name'){
        res.writeHead(200, {'Content-Type': 'text/plain; charset=utf8'});
        res.end("Смолик Валерий Александрович");
    }
    else{
        res.writeHead(404, {'content-type': 'text/html'})
        res.end(`Page don't found`)
    }

}).listen(5000,'127.0.0.1');

console.log('Server running at http://127.0.0.1:5000/api/name')