const EventEmitter = require('events');
let db_data = [
    {id:"1",name:"Kirill",bday:'2003-08-21'},
    {id:"2",name:"Valeriy",bday:'2003-01-09'},
    {id:"3",name:"Eugene",bday:'2004-02-22'},
];
class DB extends EventEmitter{
    select(){return db_data;};
    insert(object){
        let here=false;
        db_data.forEach(el=>{
            if(el.id.toString()===object.id){
                here = true;
            }
        })
        if(!here)
            db_data.push(object);
    };
    update(object){
        const temp = db_data.map(el=>{
            if(el.id.toString() === object.id)
                return object;
            else
                return el;
        });
        db_data = temp;
    };
    delete(object){
        db_data.splice(db_data.findIndex(el=>el.id.toString()===object.id),1);
    };
}
exports.DB = DB;