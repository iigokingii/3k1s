const WebSocket = require("ws");
const fs = require('fs');

const wsServer = new WebSocket.Server({port: 4000});
console.log('WebSocket Server running at ws://localhost:4000/');

wsServer.on('connection', onConnect);
function  onConnect(wsClient){
    console.log('Server:New Client');
    let k = 0;
    fs.readFile('./download/downloaded.txt', (err, data) => {
        if (err) {
            console.error('Ошибка чтения файла:', err);
        }
        else{
            let message = {
                action: 'sendFile',
                data: `${data}`
            }
            wsClient.send(JSON.stringify(message));
        }
    });
    wsClient.on('close', function() {
        // отправка уведомления в консоль
        console.log('Пользователь отключился');
    });
}