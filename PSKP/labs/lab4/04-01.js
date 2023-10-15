const http = require('http');
const url = require('url');
const fs = require('fs');
let data = require('./DB.js');
let db = new data.DB();
db.on('GET',(request,response)=>{
    console.log('DB.GET');
    response.end(JSON.stringify(db.select()))
});

db.on('POST',(request,response)=>{
    console.log("DB.POST");
    request.on('data',data=>{
        let temp = JSON.parse(data);
        db.insert(temp);
        response.end(JSON.stringify(temp));
    })
});

db.on('PUT',(request,response)=>{
    console.log('DB.PUT');
    request.on('data',data=>{
        let temp = JSON.parse(data);
        db.update(temp);
        //console.log(db.get());
        response.end(JSON.stringify(temp))
    })
});

db.on('DELETE',(request,response)=>{
    console.log('DB.DELETE');
    request.on('data',data=>{
        let temp = JSON.parse(data);
        db.delete(temp);
        //console.log(db.get());
        response.end(JSON.stringify(temp))
    })
});

http.createServer((request,response)=>{
    if(url.parse(request.url).pathname==="/"){
        let html = fs.readFileSync('./04-02.html');
        response.writeHead(200,{'Content-type':'text/html; charset=utf-8'});
        response.end(html);
    }
    else if (url.parse(request.url).pathname==='/api/db'){
        db.emit(request.method,request,response);
    }
}).listen(5000,'127.0.0.1');

console.log('Server running at http://127.0.0.1:5000');
