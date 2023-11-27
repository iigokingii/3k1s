const WebSocket = require('ws');
let n = 0;
const wss = new WebSocket.Server({ port: 4000});
wss.on('connection', ws => {

    ws.on('message', mess => {
        console.log('\nclient message: ', mess.toString());
        ws.send(JSON.stringify({ server: n++, client: JSON.parse(mess).client, timestamp: new Date().toISOString() }))
    })

});
wss.on('error', error => {
    console.log('[ERROR] WebSocket: ', error.message);
});