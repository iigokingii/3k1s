function calcSquare(data){
    return new Promise((resolve, reject)=>{
        if(typeof data!="undefined"){
            let number = parseInt(data);
            if(!Number.isInteger(number)){
                reject("Error of type ");
            }
            else
                resolve(`Square of ${data}: ${data*data}`,data*data);
        }
    })
}
function calcCube(data){
    return new Promise((resolve, reject)=>{
        if(typeof data!="undefined"){
            let number = parseInt(data);
            if(!Number.isInteger(number)){
                reject("Error of type ");
            }
            else
                resolve(`Cube of ${data}: ${data*data*data}`, );
        }
    })
}
function calcFourth(data){
    return new Promise((resolve, reject)=>{
        if(typeof data!="undefined"){
            let number = parseInt(data);
            if(!Number.isInteger(number)){
                reject("Error of type ");
            }
            else
                resolve(`Fourth Degree of ${data}: ${data*data*data*data}`,);
        }
    })
}

Promise.all([calcSquare(2),calcCube(2),calcFourth(2),{key:"Degrees of number: "}])
    .then((data)=>{
        console.log(data);
    })
    .catch((error)=>{
        console.log(error);
    })

Promise.all([calcSquare("g"),calcCube(2),calcFourth(2),{key:"Degrees of number: "}])
    .then((data)=>{
        console.log(data);
    })
    .catch((error)=>{
        console.log(error);
    })
