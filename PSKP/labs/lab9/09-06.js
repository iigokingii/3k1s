const rpcServer = require('rpc-websockets').Server;
const server = new rpcServer({ port: 4000, host: 'localhost' });


server.event('A');
server.event('B');
server.event('C');

console.log('What event to emit? (A,B,C)')
process.stdin.setEncoding('utf-8');
process.stdin.on('readable', () => {
    let data = null;
    while ((data = process.stdin.read()) != null) {
        switch (data.trim().toUpperCase()) {
            case 'A':
                server.emit('A', 'event A');
                break;
            case 'B':
                server.emit('B', 'event B');
                break;
            case 'C':
                server.emit('C', 'event C');
                break;
            case 'EXIT':
                process.exit(0);
        }
    }
});