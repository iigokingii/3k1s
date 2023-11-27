const rpcClient = require('rpc-websockets').Client;
let webSocket = new rpcClient('ws://localhost:4000/');

webSocket.on('open',()=>{
    webSocket.call('square',[3]).then(result=>{
        console.log(`square[3] = ${result}`)
    }).catch(err=>{
        console.log(err.message)
    });
    webSocket.call('square',[5,4]).then(result=>{
        console.log(`square[5,4] = ${result}`)
    }).catch(err=>{
        console.log(err.message)
    });
    webSocket.call('sum',[2]).then(result=>{
        console.log(`sum[2] = ${result}`)
    }).catch(err=>{
        console.log(err.message)
    });
    webSocket.call('sum',[2,4,6,8,10]).then(result=>{
        console.log(`sum[2,4,6,8,10] = ${result}`)
    }).catch(err=>{
        console.log(err.message)
    });
    webSocket.call('mul',[3]).then(result=>{
        console.log(`mul[3] = ${result}`)
    }).catch(err=>{
        console.log(err.message)
    });
    webSocket.call('mul',[3,5,7,9,11,13]).then(result=>{
        console.log(`mul[3,5,7,9,11,13] = ${result}`)
    }).catch(err=>{
        console.log(err.message)
    });
    webSocket.login({login:'lab9',password:'pass'}).then(()=>{
        webSocket.call('fib',[1]).then(result=>{
            console.log(`fib[1] = ${result}`)
        }).catch(err=>{
            console.log(err.message)
        });
        webSocket.call('fib',[2]).then(result=>{
            console.log(`fib[2] = ${result}`)
        }).catch(err=>{
            console.log(err.message)
        });
        webSocket.call('fib',[7]).then(result=>{
            console.log(`fib[7] = ${result}`)
        }).catch(err=>{
            console.log(err.message)
        });
        webSocket.call('fact',[0]).then(result=>{
            console.log(`fact[0] = ${result}`)
        }).catch(err=>{
            console.log(err.message)
        });
        webSocket.call('fact',[5]).then(result=>{
            console.log(`fact[5] = ${result}`)
        }).catch(err=>{
            console.log(err.message)
        });
        webSocket.call('fact',[10]).then(result=>{
            console.log(`fact[10] = ${result}`)
        }).catch(err=>{
            console.log(err.message)
        });
    }).catch(err=>{
        console.log(err.message)
    })
});