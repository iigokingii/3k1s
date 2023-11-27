const rpcClient = require('rpc-websockets').Client;
let webSocket = new rpcClient('ws://localhost:4000/');

webSocket.on('open',()=>{
    webSocket.subscribe('B')
    webSocket.on('B', (data)=> {
        console.log(data)
    })
})

