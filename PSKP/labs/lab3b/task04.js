function createOrder(CardNumber){
    validCard = validateCard(CardNumber);
    if(validCard){
        var uuid = create_UUID();
        return new Promise((resolve, reject)=>{
            setTimeout(()=>{
                resolve(uuid);
            },5000)
        })
    }
    else{
        return new Promise((resolve, reject)=>{
            reject("Card is not valid");
        })
    }
}
function proceedToPayment(uuid){
    console.log("Order id: ",uuid);
    let k = getRandomInt(2);
    if(k===0)
        return new Promise((resolve, reject)=>{
            reject("Payment failed")
        });
    if(k===1)
        return new Promise((resolve, reject)=>{
            resolve("Payment successfull")
        });
}
function create_UUID() {
    var s = [];
    var hexDigits = "0123456789ABCDEF";
    for (var i = 0; i < 32; i++) {
        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
    }
    s[12] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
    s[16] = hexDigits.substr((s[16] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01

    var uuid = s.join("");
    return uuid;
}
function validateCard(cardNumber){
    console.log("Card number: ",cardNumber);
    let k = getRandomInt(2);
    if(k===0)
        return false;
    if(k===1)
        return true;
}
function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}
createOrder(123)
    .then((result)=>{
        proceedToPayment(result).then((result)=>{
            console.log("Обработчик ",result);
        }).catch((error)=>{
            console.log("Обработчик ",error);
        });
})
.catch((error)=>{
    console.log("Обработчик error: ",error);
})

const CO = async()=>{
    try{
        let res1 = await createOrder(123);
        //console.log("Async/Await Order id: ",res1);
        let res2 = await proceedToPayment(res1);
        console.log("Async/Await: ",res2)
    }
    catch (error){
        console.log("Async/Await error: ",error);
    }
}
CO();