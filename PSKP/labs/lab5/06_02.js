const send = require("C:\\Users\\User\\AppData\\Roaming\\npm\\node_modules\\goking");
const http = require("http");
const fs = require("fs");
const url = require('url');

const server = http.createServer((request,response)=>{
    let path = url.parse(request.url).pathname;
    if(path==="/"){
        let html = fs.readFileSync('./index.html');
        response.writeHead(200,{'Content-type':'text/html; charset=utf-8'});
        response.end(html);
    }
    else if (path==='/send'){
        //send jeka.pedro@mail.ru
        //pass BiT6maeXUAEfCX35aUQG
        //receiver smolik.valera@mail.ru
        //message test

        // 1. npm adduser goking
        // 2. npm init --scope=@goking
        // 3. npm publish -access public
        request.on('data',data=>{
            let temp = JSON.parse(data);
            console.log(temp);
            send(temp.sender,temp.receiver,temp.password,temp.message);
        })
    }
});
server.listen(5000,'127.0.0.1');

console.log('Server running at http://127.0.0.1:5000/');





