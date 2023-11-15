var http = require('http');
var querystring = require('querystring');

var postData='<request id = "28">\n' +
    '<x value = "1"/>\n' +
    '<x value = "2"/>\n' +
    '<m value = "a"/>\n' +
    '<m value = "b"/>\n' +
    '<m value = "c"/>\n' +
    ' </request>'

var options = {
    hostname: '127.0.0.1',
    port: 5000,
    path: '/XML',
    method: 'POST',
    headers: {
        'Content-Type': 'application/xml',
        'Content-Length': postData.length
    }
};

var req = http.request(options, function(res) {
    console.log('STATUS: ' + res.statusCode);
    res.setEncoding('utf8');
    res.on('data', function (chunk) {
        console.log("BODY"+chunk);
    });
});

req.on('error', function(e) {
    console.log('problem with request: ' + e.message);
});

// write data to request body
req.write(postData);
req.end();


/*
const http = require("http");
const xml2js = require('xml2js');

const xmlData = `
 <request id = "28">
    <x value = "1"/>
    <x value = "2"/>
    <m value = "a"/>
    <m value = "b"/>
    <m value = "c"/>
 </request>
`;
// Convert XML to string
const xmlBuilder = new xml2js.Builder();
const xmlString = xmlBuilder.buildObject(xmlData);

const options = {
    method:"POST",
    headers: {
        'Content-Type': 'application/xml',
        'Accept': 'application/xml',
        'Content-Length': xmlString.length
    }
}

const request = http.request("http://127.0.0.1:5000/XML",options,(response)=>{
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
request.write(xmlString);
request.end();*/
