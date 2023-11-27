const rpcClient = require('rpc-websockets').Client;
const async = require('async');
let webSocket = new rpcClient('ws://localhost:4000/');

webSocket.on('open',()=>async.parallel([
    task1,
    task2,
    task3,
    task4,
    task5,
    task6,
    task7,
    task8,
    task9,
    task10,
    task11,
    task12
    ],(err,result)=>{
        if (err)
            console.log('\n[ERROR]: ', err);
        else
            console.log('\n[OK] Result =', result);
        webSocket.close();
    })
)

const task1 = (callback)=>{
    webSocket.call('square', [3])
        .then(result=>callback(null,`square[3]=${result}`))
        .catch(err=>callback(err.message,null));

}
const task2 = (callback)=>{
    webSocket.call('square', [5,4])
        .then(result=>callback(null,`square[5,4] = ${result}`))
        .catch(err=>callback(err.message,null));
}
const task3 = (callback)=>{
    webSocket.call('sum',[2])
        .then(result=>callback(null,`sum[2] = ${result}`))
        .catch(err=>callback(err.message,null));
}
const task4 = (callback)=>{
    webSocket.call('sum',[2,4,6,8,10])
        .then(result=>callback(null,`sum[2,4,6,8,10] = ${result}`))
        .catch(err=>callback(err.message,null));
}
const task5 = (callback)=>{
    webSocket.call('mul',[3])
        .then(result=>callback(null,`mul[3] = ${result}`))
        .catch(err=>callback(err.message,null));
}
const task6 = (callback)=>{
    webSocket.call('mul',[3,5,7,9,11,13])
        .then(result=>callback(null,`mul[3,5,7,9,11,13] = ${result}`))
        .catch(err=>callback(err.message,null));
}
const task7 = (callback)=>{
    webSocket.login({login:'lab9',password:'pass'}).then(()=> {
        webSocket.call('fib', [1])
            .then(result=>callback(null,`fib[1] = ${result}`))
            .catch(err=>callback(err.message,null));
    }).catch(err=>callback(err.message,null));
}
const task8 = (callback)=>{
    webSocket.login({login:'lab9',password:'pass'}).then(()=> {
        webSocket.call('fib',[2])
            .then(result=>callback(null,`fib[2] = ${result}`))
            .catch(err=>callback(err.message,null));
    }).catch(err=>callback(err.message,null));
}
const task9 = (callback)=>{
    webSocket.login({login:'lab9',password:'pass'}).then(()=> {
        webSocket.call('fib',[7])
            .then(result=>callback(null,`fib[7] = ${result}`))
            .catch(err=>callback(err.message,null));
    }).catch(err=>callback(err.message,null));
}

const task10 = (callback)=>{
    webSocket.login({login:'lab9',password:'pass'}).then(()=> {
        webSocket.call('fact',[0])
            .then(result=>callback(null,`fact[0] = ${result}`))
            .catch(err=>callback(err.message,null));
    }).catch(err=>callback(err.message,null));
}

const task11 = (callback)=>{
    webSocket.login({login:'lab9',password:'pass'}).then(()=> {
        webSocket.call('fact',[5])
            .then(result=>callback(null,`fact[5] = ${result}`))
            .catch(err=>callback(err.message,null));
    }).catch(err=>callback(err.message,null));
}

const task12 = (callback)=>{
    webSocket.login({login:'lab9',password:'pass'}).then(()=> {
        webSocket.call('fact',[10])
            .then(result=>callback(null,`fact[10] = ${result}`))
            .catch(err=>callback(err.message,null));
    }).catch(err=>callback(err.message,null));
}

