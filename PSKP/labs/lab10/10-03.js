const udp = require('dgram');
const PORT =4000;


let server = udp.createSocket('udp4');

server.on('error',err => {
    console.log(err.message);
    server.close();
})
server.on('message',(msg,info)=>{
    console.log('Server: get from client '+msg.toString());
    console.log('Server: get %d bytes from %s:%d',msg.length,info.address,info.port);
    server.send(`Echo: ${msg}`,info.port,info.address,(err)=>{
        if(err)
            server.close();
        else
            console.log('Server: data were sended to client');
    });
});

server.on('listening',()=>{
    console.log(`Server listening port : ${server.address().port}`);
    console.log(`Server IP:${server.address().address}`);
});

server.on('close',() => {
    console.log('Server closed');
    server.close();
})

server.bind(PORT);