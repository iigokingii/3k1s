const http = require('http');
const hostname = '127.0.0.1';
const port = 3000;
let headers = (r)=>{
    let rc ='';
    for(key in r.headers)
        rc += '<h3>'+key+':'+r.headers[key]+'</h3>';
    return rc;
}

const server = http.createServer(function (request,response){
    let b = '';
    request.on('data',str=>{b+=str;console.log('data',b);})
    response.writeHead(200,{'Content-Type':'text/html; charset=utf-8'});
    request.on('end',()=>response.end(
        '<!DOCTYPE html><html><head><title>01-02</title></head>'+
        '<body>'+
        '<h1>Structure of request:</h1>'+
        '<h2>'+'method: '+request.method + '</h2>'+
        '<h2>'+'uri: '+request.uri + '</h2>'+
        '<h2>'+'version: '+request.httpVersion + '</h2>'+
        '<h2>'+'headers: '+'</h2>'+
        headers(request)+
        '<h2>'+'Body: '+b+'</h2>'+
        '</body>'+
        '</html>'
    ))
})

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});