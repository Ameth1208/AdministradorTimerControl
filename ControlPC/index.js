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
        if (command === 'timeUp') {
           ws.send("timeInit");
            setTimeout(()=>{
                pc.run('lock', (err) => {
                    res.send({error: err != undefined, msg: 'Error executing the command'});
                });            
            },600000);
                        
        } 
    })
})