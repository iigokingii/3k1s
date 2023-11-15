const http = require("http");


const data = JSON.stringify({
    "__comment":" Запрос.Лабораторная работа 8/10",
    "x":1,
    "y":2,
    "s":"Сообщение",
    "m":["a","b","c","d"],
    "o":{"surname":"Иванов","name":"Иван"}
})
const options = {
    method:"POST",
    'Content-Length':data.length
}

const request = http.request("http://127.0.0.1:5000/JSON",options,(response)=>{
    if(response.statusCode !==200){
        console.log("Статус код: "+response.statusCode);
        console.log("Пояснение к статус коду: "+response.statusMessage);
        return;
    }
    let responseData = '';
    // Receive data
    response.on('data', (chunk) => {
        responseData += chunk;
    });
    // Process response
    response.on('end', () => {
        console.log("Статус код: "+response.statusCode);
        console.log("Пояснение к статус коду: "+response.statusMessage);
        console.log("Отправленные сервером данные: "+responseData);
    });
})
request.write(data);
request.end();