function thirdJob(data){
    return new Promise((resolve, reject)=>{
        if(typeof data!="undefined"){
            let number = parseInt(data);
            if(!Number.isInteger(number)){
                reject("Error of type ");
            }
            else if(number %2 === 1){
                setTimeout(()=>{
                    resolve("odd")
                },1000);
            }
            else if(number%2 === 0){
                setTimeout(()=>{
                    reject("even")
                },2000);
            }
        }
    })
}

let TJ1 = thirdJob(2);
let TJ2 = thirdJob("s");
let TJ3 = thirdJob(1);

TJ1.then((result)=>{
    console.log("result of thirdJob function: ",result);
})
    .catch((error)=>{
        console.log("Error:",error)
    });
TJ2.then((result)=>{
    console.log("result of thirdJob function: ",result);
})
    .catch((error)=>{
        console.log("Error:",error)
    });
TJ3.then((result)=>{
    console.log("result of thirdJob function: ",result);
})
    .catch((error)=>{
        console.log("Error:",error)
    });

const doAllTests = async()=>{
    try{
        let res1 = await thirdJob(2);
        let res2 = await thirdJob(1);
        let res3 = await thirdJob("s");
        console.log("Success: ",[res1,res2,res3]);
    }
    catch (error){
        console.log(error);
    }
}
doAllTests();
