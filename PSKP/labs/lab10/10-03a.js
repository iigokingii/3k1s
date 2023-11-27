const udp = require('dgram');
const client =udp.createSocket('udp4');
const PORT =4000;
const HOST = 'localhost';

client.on('message',(msg,info)=>{
    console.log("#Client Server Sended: "+msg.toString())
})

let data = Buffer.from('Hello From Client');
client.send(data,PORT,HOST,(err)=>{
    if (err)
        client.close();
    else
        console.log('#Client : data successfully sended.')
})