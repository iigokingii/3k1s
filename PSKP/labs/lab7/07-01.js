const http = require("http");

const options = {
    hostname:"127.0.0.1",
    port:5000,
    method:"GET",
    path:"/"
}

const request = http.request(options,(response)=>{
    if(response.statusCode !==200){
        console.error("error in request");
        return;
    }
    let data = '';

    // Receive data
    response.on('data', (chunk) => {
        data += chunk;
    });

    // Process response
    response.on('end', () => {
        console.log("Статус код: "+response.statusCode);
        console.log("Пояснение к статус коду: "+response.statusMessage);
        //console.log("IP адресс сервера: "+response.socket.remoteAddress);
        console.log("IP адресс сервера: "+options.hostname);
        console.log("Порт сервера: "+options.port);
        console.log("Отправленные сервером данные: "+data);
    });
})

request.end();