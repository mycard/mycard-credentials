#!/usr/bin/env node

'use strict';

const fs = require('fs');
const url = require('url');
const http = require('http');
const child_process = require('child_process');

const server = http.createServer((req, res) => {

    let app = url.parse(req.url).pathname;
    fs.stat(app, (error, stats)=>{
        if(error || !stats.isDirectory()){
            res.writeHead(404);
            res.end();
        }else{
            child_process.spawn('pull.sh', [app]);
        }
    });

});

server.listen(80);
