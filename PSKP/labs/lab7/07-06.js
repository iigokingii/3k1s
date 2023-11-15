const axios = require('axios');
const fs = require('fs');
const FormData = require('form-data');


const filePath = 'MyFile.png';  // Путь к файлу MyFile.png

const url = `http://127.0.0.1:5000/upload`;  // Полный URL для отправки запроса

const formData = new FormData();
formData.append('file', fs.createReadStream(filePath), 'MyFile.png');

axios.post(url, formData, {
    headers: formData.getHeaders()
})
    .then(response => {
        console.log('Ответ сервера:', response.data);
    })
    .catch(error => {
        console.error('Ошибка при отправке запроса:', error);
    });