var http = require("http");
var url = require("url")
var fs = require("fs")
var fact = (n)=>{
    return (n<=1 ? 1 : n*fact(n-1));
}

http.createServer(function (req,res){
    let rc = JSON.stringify({k:0});
    let path = url.parse(req.url).pathname;
    if(path=='/fact'){
        let param = url.parse(req.url,true).query.k;
        if(typeof param!="undefined"){
            let k = parseInt(param);
            if(Number.isInteger(k)){
                res.writeHead(200,{'Content-Type': 'application/json; charset=utf8'});
                res.end(JSON.stringify({k:k,fact:fact(k)}));
            }
        }
    }
    else if(path=='/'){
        let html = fs.readFileSync('fact.html');
        res.writeHead(200,{'Content-Type': 'text/html; charset=utf8'});
        res.end(html);
    }
    else{
        res.end(rc);
    }

}).listen(5000,'127.0.0.1');

console.log('Server running at http://127.0.0.1:5000/fact?k=3')