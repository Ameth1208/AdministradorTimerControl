'use strict';

const path = require('path');
const express = require('express');
//const pc = require('./pc-controls');
const port = 8000;
const app = express();





app.listen(port, () => console.log(`Server listening on port: ${port}`));