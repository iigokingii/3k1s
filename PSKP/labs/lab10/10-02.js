const net = require('net');
let HOST = '127.0.0.1';
let PORT1 = 4000;
let PORT2 = 5000;

let sum = 0;

function createServer(port){
    return (sock)=>{
        console.log(`Connected ${port}: `+sock.remoteAddress + ': '+sock.remotePort);
        sock.on('data',(data)=>{
            console.log(`#${port}: Server data:`,data,sum);
            sum +=data.readInt32LE();
        });
        let buf = Buffer.alloc(4);
        setInterval(()=>{
            buf.writeInt32LE(sum,0);
            sock.write(buf)
        },5000);

        sock.on('close',()=>{
            console.log('Server closed');
        })
    }
}

net.createServer(createServer(PORT1)).listen(PORT1,HOST).on('listening',()=>{
    console.log(`TCP-SERVER: ${HOST}:${PORT1}`)
});
net.createServer(createServer(PORT2)).listen(PORT2,HOST).on('listening',()=>{
    console.log(`TCP-SERVER: ${HOST}:${PORT2}`)
});


