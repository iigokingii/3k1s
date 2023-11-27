const WebSocket = require('ws');
const server = new WebSocket.Server({ port: 4000 });
var n = 0;
var actives = 0;

server.on('connection', (socket) => {
    actives++;
        const message = {
            action: 'ping',
        }
        socket.send(JSON.stringify(message));

        socket.on('message',(message)=>{
            let json = JSON.parse(message);
            console.log('Json:'+json.action);
            switch (json.action){
                case 'pong':
                    console.log("client message: "+ json.action)
                    break;
                    default:
                        console.log('Unknown command')
                        break;
            }
        });
        socket.on('close', () => {
            console.log('Client disconnected');
            actives--;
        });
    });

    setInterval(()=>{
        console.log(`Number of active clients : ${server.clients.size}`);
    },5000)

setInterval(() => {
    const jsonMessage = {
        action: "lab9-03Broadcast",
        data: `09-03-server: ${n}`
    }
    console.log(`Sended data: ${jsonMessage.data}`);
    server.clients.forEach((client) => {
        client.send(JSON.stringify(jsonMessage));
    });
    n++;
},15000);
console.log('WebSocket Server running at ws://localhost:4000/');