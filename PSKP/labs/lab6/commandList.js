const commandList = [
    {id:"0",method:"GET",URI:"/connection?set=set",task:"task01"},
    {id:"1",method:"GET",URI:"/headers",task:"task02"},
    {id:"2",method:"GET",URI:"/parameter?x=x&y=y",task:"task03"},
    {id:"3",method:"GET",URI:"/parameter/x/y",task:"task04"},
    {id:"4",method:"GET",URI:"/socket",task:"task05"},
    {id:"5",method:"GET",URI:"/resp-status?code=c&mess=m",task:"task06"},
    {id:"6",method:"POST",URI:"/formparameter",task:"task07"},
    {id:"7",method:"POST",URI:"/json",task:"task08"},
    {id:"8",method:"POST",URI:"/xml",task:"task09"},
    {id:"9",method:"GET",URI:"/files",task:"task10"},
    {id:"10",method:"GET",URI:"/files/filename",task:"task11"},
    {id:"11",method:"GET/POST",URI:"/upload",task:"task12"},
]
module.exports = commandList;