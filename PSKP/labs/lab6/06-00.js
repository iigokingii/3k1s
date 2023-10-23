const http = require("http");
const fs = require("fs");
const url = require("url");
const { parseString } = require('xml2js');

const Commands = require("./commandList");
let headers = (r)=>{
    let rc ='';
    for(key in r.headers)
        rc += '<h3>'+key+':'+r.headers[key]+'</h3>';
    return rc;
}
function parseFormData(body) {
    const formData = {};
    const keyValuePairs = body.split('&');

    for (let i = 0; i < keyValuePairs.length; i++) {
        const [key, value] = keyValuePairs[i].split('=');
        formData[key] = decodeURIComponent(value);
    }

    return formData;
}
let counter= 0;
const server = http.createServer((request,response)=> {
    let path = url.parse(request.url).pathname;

    if (path === "/") {
        response.writeHead(200, {'Content-type': 'text/html; charset=utf-8'});
        let commands = fs.readFileSync('./commands.html');
        response.end(commands);
    }
    if (path === "/commands") {
        response.writeHead(200, {'Content-type': 'text/html; charset=utf-8'});
        let commands = Commands;
        response.end(JSON.stringify(commands));
    }
    if (path === "/connection" && request.method === "GET") {
        let param = url.parse(request.url, true).query.set;
        if (typeof param === "undefined") {
            response.writeHead(200, {'Content-type': 'text/html; charset=utf-8'});
            response.end(JSON.stringify({KeepAliveTimeout: keepAlive}));
        } else if (typeof param !== "undefined") {
            let value = parseInt(param);
            if (Number.isInteger(value)) {
                response.writeHead(200, {'Content-type': 'text/html; charset=utf-8'});
                server.keepAliveTimeout = value;
                response.end(`Setted new KeepAlive value: ${value}`);
            } else {
                response.writeHead(400, {'Content-type': 'text/html; charset=utf-8'});
                response.end(`input value is incorrect: ${param}`);
            }
        }
    }
    if (path === "/headers" && request.method === "GET") {
        response.writeHead(200, {'Content-type': 'text/html; charset=utf-8'});
        response.end(
            '<!DOCTYPE html><html><head><title>01-02</title></head>' +
            '<body>' +
            '<h1>' + 'request headers: ' + '</h1>' +
            headers(request) +
            '<h1>' + 'response headers: ' + '</h1>' +
            headers(response) +
            '</body>' +
            '</html>'
        );
    }
    if (path === "/parameter" && request.method === "GET") {
        let param1 = url.parse(request.url, true).query.x;
        let param2 = url.parse(request.url, true).query.y;
        if (typeof param1 !== "undefined" && typeof param1 !== "undefined") {
            let x = parseInt(param1);
            let y = parseInt(param2);
            if (Number.isInteger(x) && Number.isInteger(y)) {
                response.writeHead(400, {'Content-type': 'text/html; charset=utf-8'});
                if (y === 0) {
                    response.end("Division by zero (y=0)");
                } else {
                    let Sum = x + y;
                    let dif = x - y;
                    let mul = x * y;
                    let div = x / y;
                    response.status = 200;
                    response.end(
                        '<!DOCTYPE html><html><head><title>01-02</title></head>' +
                        '<body>' +
                        '<h2>' + `sum: ${Sum}` + '</h2>' +
                        '<h2>' + `diff: ${dif}` + '</h2>' +
                        '<h2>' + `mul: ${mul}` + '</h2>' +
                        '<h2>' + `div: ${div}` + '</h2>' +
                        '</body>' +
                        '</html>'
                    );
                }

            } else {
                response.writeHead(400, {'Content-type': 'text/html; charset=utf-8'});
                response.end(`input value is incorrect`);
            }
        } else {
            response.writeHead(400, {'Content-type': 'text/html; charset=utf-8'});
            response.end(`input value `);
        }
    }
    if (path.includes("/parameter/") && request.method === "GET") {
        let parsed = url.parse(request.url);
        let params = parsed.pathname.split('/');
        if (params.length === 4) {
            const param1 = params[2];
            const param2 = params[3];
            if (typeof param1 !== "undefined" && typeof param1 !== "undefined") {
                let x = parseInt(param1);
                let y = parseInt(param2);
                if (Number.isInteger(x) && Number.isInteger(y)) {
                    response.writeHead(400, {'Content-type': 'text/html; charset=utf-8'});
                    if (y === 0) {
                        response.end("Division by zero (y=0)");
                    } else {
                        let Sum = x + y;
                        let dif = x - y;
                        let mul = x * y;
                        let div = x / y;
                        response.status = 200;
                        response.end(
                            '<!DOCTYPE html><html><head><title>01-02</title></head>' +
                            '<body>' +
                            '<h2>' + `sum: ${Sum}` + '</h2>' +
                            '<h2>' + `diff: ${dif}` + '</h2>' +
                            '<h2>' + `mul: ${mul}` + '</h2>' +
                            '<h2>' + `div: ${div}` + '</h2>' +
                            '</body>' +
                            '</html>'
                        );
                    }

                } else {
                    response.writeHead(400, {'Content-type': 'text/html; charset=utf-8'});
                    response.end(`input value is incorrect`);
                }
            }
        } else {
            response.writeHead(400, {'Content-type': 'text/html; charset=utf-8'});
            response.end("Bad parameters");
        }
    }
    if (path === "/socket" && request.method === "GET") {
        response.writeHead(200, {'Content-type': 'text/html; charset=utf-8'})
        response.end(
            '<!DOCTYPE html><html><head><title>01-02</title></head>' +
            '<body>' +
            '<h1>Client IP:</h1>' +
            '<h3>' + request.connection.remoteAddress + '</h3>' +
            '<h1>Client PORT:</h1>' +
            '<h3>' + request.connection.remotePort + '</h3>' +
            '<h1>Server IP:</h1>' +
            '<h3>' + request.connection.localAddress + '</h3>' +
            '<h1>Server PORT:</h1>' +
            '<h3>' + request.connection.localPort + '</h3>' +
            '</body>' +
            '</html>'
        )
    }
    if (path === "/resp-status" && request.method === "GET") {
        let param1 = url.parse(request.url, true).query.code;
        let param2 = url.parse(request.url, true).query.mess;
        if (typeof param1 !== "undefined" && typeof param1 !== "undefined") {
            let x = parseInt(param1);
            if (Number.isInteger(x)) {
                response.statusCode = x;
                response.statusMessage = param2;
                response.end(`${param1} and ${param2} are setted.`);
            } else {
                response.writeHead(400, {'Content-type': 'text/html; charset=utf-8'});
                response.end("status must be a number.")
            }
        } else {
            response.writeHead(400, {'Content-type': 'text/html; charset=utf-8'});
            response.end("set parameters.")
        }

    }
    if (path === "/formparameter") {
        if (request.method === "GET") {
            response.writeHead(200, {'Content-type': 'text/html; charset=utf-8'})
            let commands = fs.readFileSync('./formparameter.html');
            response.end(commands);
        }
        if (request.method === "POST") {
            let body = '';
            request.on('data', chunk => {
                body += chunk;
            });
            request.on('end', () => {
                const formData = parseFormData(body);
                console.log('Полученные данные формы:', formData);
                response.writeHead(200, {"Content-type": "text/plain"});
                response.end(JSON.stringify(formData));
            })
        }
    }
    if (path === "/json" && request.method === "POST") {
        /*
        {
            "__comment":" Запрос.Лабораторная работа 8/10",
            "x":1,
            "y":2,
            "s":"Сообщение",
            "m":["a","b","c","d"],
            "o":{"surname":"Иванов","name":"Иван"}
        }
        */
        let body = '';
        request.on('data', chunk => {
            body += chunk;
        });
        request.on('end', () => {
            const data = JSON.parse(body);
            console.log('Полученные данные Postman:', data);
            let x_plus_y = data.x + data.y;
            let name = '';
            let concat = data.s + " :" + data.o.surname + ", " + data.o.name;
            let messageFromServer = {
                "__comment": data.__comment,
                "x_plus_y": x_plus_y,
                "Concatination_s_O": concat,
                "Length_m": data.m.length
            }
            response.writeHead(200, {"Content-type": "text/plain"});
            response.end(JSON.stringify(messageFromServer));
        })
    }
    if (path === "/xml" && request.method === "POST") {
        /*
            <request id = "28">
                <x value = "1"/>
                <x value = "2"/>
                <m value = "a"/>
                <m value = "b"/>
                <m value = "c"/>
            <request/>
        */
        let body = '';
        request.on('data', chunk => {
            body += chunk;
        });

        request.on('end', () => {
            parseString(body, (err, result) => {
                if (err) {
                    console.error('Ошибка разбора XML:', err);
                    response.statusCode = 400;
                    response.setHeader('Content-Type', 'text/plain');
                    response.end('Ошибка разбора XML');
                } else {
                    const data = result;
                    //console.log('Полученные данные Postman(xml):', data);
                    const numReq =data.request.$.id;

                    let sum = 0;
                    //console.log(data.request.x);
                    data.request.x.forEach(el=>{
                        sum+=Number.parseInt(el.$.value);
                    })

                    let concat = '';
                    //console.log("sum: ",sum);
                    data.request.m.forEach(el=>{
                        concat+=el.$.value;
                    })

                    response.statusCode = 200;
                    response.setHeader('Content-Type', 'application/xml');

                    const xmlResponseFromServer = `<response id = ${counter} request="${numReq}"> 
                                                            <sum element = "x" result="${sum}"/> 
                                                            <concat element = "m" result = "${concat}"/>
                                                           </response>`
                    counter++;
                    response.end(xmlResponseFromServer);
                }
            });
        });
    }
    if(path==="/files" && request.method==="GET"){
        const staticDirectory = './static';
        countFilesInDirectory(staticDirectory, (err, count) => {
            if (err) {
                console.error('Ошибка подсчета файлов:', err);
                response.statusCode = 500;
                response.setHeader('Content-Type', 'text/plain');
                response.end('Ошибка сервера');
            } else {
                response.setHeader('X-static-files-count', count);
                response.statusCode = 200;
                response.setHeader('Content-Type', 'text/plain');
                response.end('Запрос выполнен');
            }
        });
    }
    if(path.includes("/files/")&& request.method==="GET"){
        let parsed = url.parse(request.url);
        let params = parsed.pathname.split('/');
        let name = params[2];
        if (params.length === 3) {
            const param = params[2];
            let path = `./static/${param}.txt`;
            fs.readFile(path,'utf-8',(err,data)=>{
                if(err){
                    response.writeHead(404,{
                        'Content-type': 'text/html; charset=utf-8'
                    })
                    response.end("File not found");
                    return
                }
                response.writeHead(200,{
                    'Content-type': 'text/html; charset=utf-8'
                })
                response.end(data)
            })
        }
        else{
            response.writeHead(400, {'Content-type': 'text/html; charset=utf-8'});
            response.end("set parameters.")
        }
    }
    if(path==="/upload"){
        if(request.method==="GET"){
            response.writeHead(200, {'Content-type': 'text/html; charset=utf-8'});
            let commands = fs.readFileSync('./upload.html');
            response.end(commands);
        }
        if(request.method==="POST"){
            const fileData = [];
            request.on('data', (chunk) => {
                fileData.push(chunk);
            });
            request.on('end', () => {
                const fileBuffer = Buffer.concat(fileData);
                const fileName = 'static/uploaded_file.txt';
                fs.writeFile(fileName, fileBuffer, (err) => {
                    response.setHeader('Content-Type', 'text/plain');
                    if (err) {
                        console.error('Ошибка сохранения файла:', err);
                        response.statusCode = 500;
                        response.end('Server error');
                    } else {
                        response.statusCode = 200;
                        response.end('File Downloaded');
                    }
                });
                console.log(fileBuffer);

            });
        }
    }



});
function countFilesInDirectory(directory, callback) {
    fs.readdir(directory, (err, files) => {
        if (err) {
            callback(err, null);
        } else {
            callback(null, files.length);
        }
    });
}


server.listen(5000,'127.0.0.1');
const keepAlive = server.keepAliveTimeout;
console.log('Server running at http://127.0.0.1:5000/');