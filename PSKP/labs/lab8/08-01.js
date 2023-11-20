const http = require("http");
const fs = require("fs");
const url = require("url");
const WebSocket = require('ws');

http.createServer((request,response)=> {
    let path = url.parse(request.url).pathname;
    if((path==="/" || path==="/start") && request.method==="GET"){
        let html = fs.readFileSync('./index.html');
        response.writeHead(200,{'Content-type':'text/html; charset=utf-8'});
        response.end(html);
    }
    else{
        response.statusCode = 400;
        response.end();
    }
}).listen(3000,'127.0.0.1');
console.log('HTTP Server running at http://127.0.0.1:3000/');

const wsServer = new WebSocket.Server({port: 4000});
console.log('WebSocket Server running at ws://localhost:4000/');

wsServer.on('connection', onConnect);


function  onConnect(wsClient){
    console.log('Server:New Client');
    let k = 0;
    wsClient.send('Привет');

    wsClient.on('message', function(message) {
        try {
            const jsonMessage = JSON.parse(message);
            switch (jsonMessage.action) {
                case 'client':
                    let n = jsonMessage.message;
                    console.log(`Get message from client. Message: ${n}`);
                    var parts = n.split(":");
                    var number = parseInt(parts[1].trim());
                    if (Number.isInteger(number)){
                        let jsonMessageFromServer = {
                            action:"server",
                            data:`08-01-server: ${number} -> ${k}`
                        }
                        k++;
                        setTimeout(()=>{
                            console.log('send data to client');
                            wsClient.send(JSON.stringify(jsonMessageFromServer));
                        },5000);
                    }
                    break;
                default:
                    console.log('Неизвестная команда');
                    break;
            }
        } catch (error) {
            console.log('Ошибка', error);
        }
    });
    wsClient.on('close', function() {
        // отправка уведомления в консоль
        console.log('Пользователь отключился');
    });
}
