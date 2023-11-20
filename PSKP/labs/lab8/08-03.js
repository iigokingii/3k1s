const WebSocket = require('ws');
const server = new WebSocket.Server({ port: 4000 });
const clients = new Set();
server.on('connection', (socket) => {
    clients.add(socket);
    socket.on('message', (message) => {
        const jsonMessage = JSON.parse(message);
        console.log(jsonMessage);
        clients.forEach((client) => {
            if (client !== socket) {
                setTimeout(()=>{
                    console.log('ssss');
                    client.send(JSON.stringify(jsonMessage));
                },5000);
            }
        });
    });
    socket.on('close', () => {
        // Remove the disconnected client from the clients Set
        clients.delete(socket);
    });
});
console.log('WebSocket Server running at ws://localhost:4000/');