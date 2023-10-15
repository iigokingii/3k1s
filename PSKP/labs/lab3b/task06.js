function calcSquare(data){
    return new Promise((resolve, reject)=>{
        if(typeof data!="undefined"){
            let number = parseInt(data);
            if(!Number.isInteger(number)){
                setTimeout(()=>{
                    reject("Error of type ");
                },1000)
            }
            else
                setTimeout(()=>{
                    resolve(`Square of ${data}: ${data*data}`,data*data);
                },2000)
        }
    })
}
function calcCube(data){
    return new Promise((resolve, reject)=>{
        if(typeof data!="undefined"){
            let number = parseInt(data);
            if(!Number.isInteger(number)){
                setTimeout(()=>{
                    reject("Error of type ");
                },3000)
            }
            else
                setTimeout(()=>{
                    resolve(`Cube of ${data}: ${data*data*data}`, );
                },4000)
        }
    })
}
function calcFourth(data){
    return new Promise((resolve, reject)=>{
        if(typeof data!="undefined"){
            let number = parseInt(data);
            if(!Number.isInteger(number)){
                setTimeout(()=>{
                    reject("Error of type ");
                },1500)
            }
            else
                setTimeout(()=>{
                    resolve(`Fourth Degree of ${data}: ${data*data*data*data}`,);
                },2500)
        }
    })
}

Promise.race([calcSquare(2),calcCube(2),calcFourth(2)])
    .then((data)=>{
        console.log("race: ",data);
    })
    .catch((error)=>{
        console.log("race: ",error);
    })

Promise.any([calcSquare(2),calcCube(2),calcFourth(2)])
    .then((data)=>{
        console.log("any: ",data);
    })
    .catch((error)=>{
        console.log("any: ",error);
    })

