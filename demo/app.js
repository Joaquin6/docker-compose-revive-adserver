const path = require('path')
const logger = require('morgan')
const express = require('express')
const app = express()
const port = 3000

app.use(logger('dev'));
app.use(express.static(path.join(__dirname, 'public')));
app.use('/static', express.static(path.join(__dirname, 'public')));

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
