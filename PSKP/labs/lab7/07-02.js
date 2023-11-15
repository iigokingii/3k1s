const http = require("http");

const options = {
    method:"GET",
}

const request = http.request("http://127.0.0.1:5000/parameter?x=3&y=1",options,(response)=>{
    if(response.statusCode !==200){
        console.log("Статус код: "+response.statusCode);
        console.log("Пояснение к статус коду: "+response.statusMessage);
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
        console.log("Отправленные сервером данные: "+data);
    });
})

request.end();