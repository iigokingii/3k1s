const net = require('net');
let HOST = '127.0.0.1';
let PORT = 4000;

net.createServer((sock)=>{
    sock.on('data',(data)=>{
        sock.write('ECHO: '+data);
    });
    sock.on('close',()=>{
        console.log('Server closed');
    })
}).listen(PORT,HOST);