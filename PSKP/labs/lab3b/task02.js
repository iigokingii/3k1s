
function secondJob(){
    return new Promise((resolve, reject)=>{
        setTimeout(()=>{
            reject('Error in secondJob Func');
        },3000)
    })
}

let SJ = secondJob();
SJ.catch((error)=>{
    console.log(error);
})

const doSJ = async()=>{
    try{
        var result = await secondJob();
    }
    catch (error){
        console.log(error);
    }
}
doSJ();

