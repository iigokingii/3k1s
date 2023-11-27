const rpcClient = require('rpc-websockets').Client;
let webSocket = new rpcClient('ws://localhost:4000/');

webSocket.on('open', ()=>{
    webSocket.login({login:'lab9',password:'pass'}).then(async()=>{
        let result = await calculate();
        console.log(`result of calc func: ${result}`)
    }).catch(err=>{
        console.log(err.message)
    })
})

async function calculate(){
    console.log('calc func');
    return  await webSocket.call('sum',[
            await webSocket.call('square',[3]),
            await webSocket.call('square',[5,4]),
            await webSocket.call('mul',[3,5,7,9,11,13])
        ])
        +
        await webSocket.call('fib',[7])
        *
        await webSocket.call('mul',[2,4,6]);
}
