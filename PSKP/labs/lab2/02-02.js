var fs = require("fs");
var http = require("http");

http.createServer(function (req,res){
    if(req.url=='/png'){
        let img = fs.readFileSync('./img.png');
        res.writeHead(200, {'Content-Type': 'image/png; charset=utf8'});
        res.end(img,'binary');
    }
    else{
        res.writeHead(404, {'content-type': 'text/html'})
        res.end(`Page don't found`)
    }

}).listen(5000,'127.0.0.1');

console.log('Server running at http://127.0.0.1:5000/png')