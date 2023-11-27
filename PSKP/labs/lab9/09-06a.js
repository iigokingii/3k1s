const rpcClient = require('rpc-websockets').Client;
let webSocket = new rpcClient('ws://localhost:4000/');

webSocket.on('open',()=>{
    webSocket.subscribe('A')
    webSocket.on('A', (data)=> {
        console.log(data)
    })
})

