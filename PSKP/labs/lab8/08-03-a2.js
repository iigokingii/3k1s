const WebSocket = require('ws');
let k = 0;
function connectToWS(){
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
        message: `interesting message from client-a2`
    }
    setTimeout(()=>{
        myWs.send(JSON.stringify(data));
    },3000)
}

connectToWS();