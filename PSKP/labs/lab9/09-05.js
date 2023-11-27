const rpcServer = require('rpc-websockets').Server;
const server = new rpcServer({ port: 4000});
server.setAuth(l=>l.login === 'lab9' && l.password ==='pass');
server.register('sum',params=>{
    let sum = 0;
    params.forEach(param=>{
        if(Number.isInteger(param))
            sum+=param;
    });
    return sum;
}).public();

server.register('square',params=>{
    if(params.length===2){
        if(Number.isInteger(params[0])&&Number.isInteger(params[1]))
            return params[0]*params[1];
    }
    if(params.length===1){
        if(Number.isInteger(params[0]))
            return Math.PI*params[0]*params[0];
    }
}).public();

server.register('mul',params=>{
    let mul = 1;
    params.forEach(param=>{
        if(Number.isInteger(param))
            mul*=param;
    });
    return mul;
}).public();

server.register('fib', params => {
    if (params.length !== 1)
        return [1];
    return fibonacci(params-1);
}).protected();

server.register('fact', params => {
    if (params.length !== 1)
        return [1];
    return factorial(params);
}).protected();


function factorial(n) {
    return (n == 1 || n == 0) ? 1 : n * factorial(n - 1);
}

function fibonacci(n) {
    if (n <= 1) return 1;
    return fibonacci(n - 1) + fibonacci(n - 2);
}