const net = require('net');
const HOST = '127.0.0.1';
const PORT = process.argv[2] ? process.argv[2] : 4000;
let number = process.argv[3] ? process.argv[3] : 1;

let client = new net.Socket();
let buffer = new Buffer.alloc(4);

    client.connect(PORT, HOST, () => {
        console.log(`\nConnected to server: ${client.remoteAddress}:${client.remotePort}\nPORT: ${PORT}\nNUMBER: ${number}`);
        let k = 0;
        let timer = setInterval(() => {
            buffer.writeInt32LE(k++,0);
            client.write(buffer);
        }, 1000);

        setTimeout(() => {
            clearInterval(timer);
            client.end();
        }, 24000);

    });

    client.on('data', data => {
        console.log(`Client received: ${data.readInt32LE()}`);
    });

    client.on('close', () => { console.log('Connection closed.'); });

    client.on('error', error => { console.log('[ERROR] ' + error.message); });