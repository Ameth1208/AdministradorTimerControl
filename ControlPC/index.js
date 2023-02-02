const express = require('express');
const { Server } = require('ws');
const pc = require('./pc-controls');

const PORT = process.env.PORT || 8080; //port for https

const server = express()
    .use((req, res) => res.send("connect"))
    .listen(PORT, () => console.log(`Listening on ${PORT}`));
    
const wss = new Server({ server });

wss.on('connection', function(ws, res) {
    ws.on('message', message => {
        var dataString = message.toString();
        
        console.log(dataString);
        if (dataString === 'timeUp') {
           ws.send("timeInit");
           //pc.run('lock');    
            setTimeout(()=>{
                pc.run('lock');         
                      
            },10000);
            ws.send('Bloqueado');          
        } 
        else if(dataString === 'consulta'){
            ws.send("Datos devueltos");
        }
    })
})