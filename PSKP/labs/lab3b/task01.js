function firtsJob(){
    return new Promise((resolve, reject)=>{
        setTimeout(()=>{
            resolve("Hello World")
        },2000)
    })
}

let FJ = firtsJob();
FJ.then((result)=>{console.log(result)});

const doFJ = async()=>{
    try{
        var result = await firtsJob();
        console.log(result);
    }
    catch (error){
        console.log(error);
    }
}

doFJ();
