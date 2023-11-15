const http = require("http");
const url = require("url");
const fs = require("fs");
const {parseString} = require("xml2js");
let counter= 0;
http.createServer((request,response)=>{
    let path = url.parse(request.url).pathname;

    if (path === "/"){
        response.writeHead(200,{'Content-type':'text/html; charset=utf-8'});
        response.end("response from server");
    }
    if (path === "/parameter") {
        let param1 = url.parse(request.url, true).query.x;
        let param2 = url.parse(request.url, true).query.y;
        let param3 = url.parse(request.url, true).query.s;
        if (typeof param1 !== undefined && typeof param2 !== undefined && param3 === undefined && request.method==="GET") {
            let x = parseInt(param1);
            let y = parseInt(param2);
            if (Number.isInteger(x) && Number.isInteger(y)) {
                if (y === 0) {
                    response.statusCode = 400;
                    response.end("Division by zero (y=0)");
                } else {
                    let Sum = x + y;
                    let dif = x - y;
                    let mul = x * y;
                    let div = x / y;
                    response.statusCode = 200;
                    response.end(
                        JSON.stringify({
                            sum:Sum,
                            dif:dif,
                            mul:mul,
                            div:div
                        })
                    );
                    return;
                }

            } else {
                response.writeHead(400, {'Content-type': 'text/html; charset=utf-8'});
                response.end(`input value is incorrect`);
            }
        }
        if(typeof param1 !== undefined && typeof param2 !== undefined&& param3!==undefined && request.method==="POST"){
            response.writeHead(200, {'Content-type': 'text/html; charset=utf-8'});
            response.end(JSON.stringify({
                message:"This is a message from server",
                param1:param1,
                param2:param2,
                param3:param3,
            }));
        }
        else {
            response.writeHead(400, {'Content-type': 'text/html; charset=utf-8'});
            response.end(`input value `);
        }
    }
    if(path==="/JSON" && request.method==="POST"){
        let bodyRequest = '';
        request.on('data', chunk => {
            bodyRequest += chunk;
        });
        request.on('end', () => {
            const data = JSON.parse(bodyRequest);
            console.log('Полученные данные Postman:', data);
            let x_plus_y = data.x + data.y;
            let name = '';
            let concat = data.s + " :" + data.o.surname + ", " + data.o.name;
            let messageFromServer = {
                "__comment": "Ответ.Лабораторная работа 8/10",
                "x_plus_y": x_plus_y,
                "Concatination_s_O": concat,
                "Length_m": data.m.length
            }
            response.writeHead(200, {"Content-type": "text/plain"});
            response.end(JSON.stringify(messageFromServer));
        })
    }
    if (path === "/XML" && request.method === "POST") {
        /*
            <request id = "28">
                <x value = "1"/>
                <x value = "2"/>
                <m value = "a"/>
                <m value = "b"/>
                <m value = "c"/>
            </request>
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
    if(path==="/upload" && request.method==="POST"){
        const fileData = [];
        request.on('data', (chunk) => {
            fileData.push(chunk);
        });
        request.on('end', () => {
            const fileBuffer = Buffer.concat(fileData);
            const fileName = 'uploaded/uploaded_file.png';
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
    if(path==="/upload" && request.method==="GET"){
        const imagePath = 'MyFile.png';
        fs.readFile(imagePath, (err, data) => {
            if (err) {
                console.error('Ошибка при чтении изображения:', err);
                response.status(500).send('Ошибка при чтении изображения');
            } else {
                response.writeHead(200, {
                    'Content-Type': 'image/jpeg',
                    'Content-Length': data.length
                });
                response.end(data);
            }
        });
    }

}).listen(5000,'127.0.0.1');
console.log('Server running at http://127.0.0.1:5000/');