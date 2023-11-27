const WebSocket = require("ws");
const fs = require('fs');

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
                case 'sendFile':
                    const fileData = Buffer.from(jsonMessage.data, 'base64');
                    fs.writeFile('./upload/text.txt', fileData, err => {
                        if (!err) {
                            console.log('File saved in upload dir');
                        } else {
                            console.log('Error while creating file')
                        }
                    });
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