const WebSocket = require('ws');
let k = 0;
function connectToWS(){
    //end after 25 sec
    setTimeout(() => {
        // Останавливаем передачу сообщений
        myWs.onmessage = null;
        console.log('Ended');
        // Закрываем WS-соединение
        myWs.close();
    },25000);
    const myWs = new WebSocket('ws://localhost:4000');
    myWs.onopen = function () {
        console.log('The client connected to the server via port 4000');
    };
    myWs.onmessage = function (message) {
        console.log('Message From Server: %s', message.data);
        sendDataToServer(myWs);
    };
    sendDataToServer(myWs);
}
function sendDataToServer(myWs){
    k++;
    let data= {
        action: 'client',
        message: `08-01-client:${k}`
    }
    setTimeout(()=>{
        myWs.send(JSON.stringify(data));
    },3000)
}

connectToWS();