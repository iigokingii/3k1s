const WebSocket = require("ws");
const myWs = new WebSocket('ws://localhost:4000');
myWs.onopen = ()=> {
    console.log('The client connected to the server via port 4000');
};
myWs.onmessage =(message)=>{
    let Jsondata = JSON.parse(message.data);
    switch (Jsondata.action){
        case "ping":
            let response ={
                action:"pong"
            }
            myWs.send(JSON.stringify(response));
            break;
        case "lab9-03Broadcast":
            console.log('Message From Server: %s', Jsondata.data);
            break;
        default:
            console.log("Unknown command");
            break;
    }
};