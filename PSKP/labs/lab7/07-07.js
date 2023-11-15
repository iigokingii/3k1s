const axios = require('axios');
const fs = require('fs');

axios.get('http://127.0.0.1:5000/upload', { responseType: 'arraybuffer' })
    .then(response => {
        const imageData = response.data;
        fs.writeFile('uploaded/image.jpg', imageData, (err) => {
            if (err) {
                console.error('Ошибка при сохранении изображения:', err);
            } else {
                console.log('Изображение успешно сохранено');
            }
        });
    })
    .catch(error => {
        console.error('Ошибка при отправке GET-запроса:', error);
    });