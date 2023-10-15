var fs = require("fs");
var http = require("http");
const readline = require("readline");
let appState = "norm"
http.createServer(function (req,res){
    res.writeHead(200,{'Content-Type': 'text/html; charset=utf8'});
    res.end(appState);
}).listen(5000,'127.0.0.1');
const rl = readline.createInterface({
    input:process.stdin,
    output:process.stdout,
    prompt:appState+'->'
});
console.log('Server running at http://127.0.0.1:5000')
rl.prompt();
rl.on('line',(line)=>{
    switch (line.trim()){
        case 'norm':
        case 'stop':
        case 'test':
        case 'idle':
            console.log('reg = '+appState+'->'+line);
            appState = line;
            break;
        case 'exit':
            process.exit(0);
        default:
            console.log('invalid state of app');
    }
    rl.setPrompt(appState+'->');
    rl.prompt();
});
