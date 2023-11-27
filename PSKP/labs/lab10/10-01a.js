var net = require('net');
let HOST = '127.0.0.1';
let PORT = 4000;

var client = new net.Socket();
client.connect(PORT,HOST,()=>{
    client.write('Hello Server from client');
})
client.on('data',(data)=>{
    console.log(`Server response: ${data}`);
})