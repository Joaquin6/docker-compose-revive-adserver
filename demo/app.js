const path = require('path')
const logger = require('morgan')
const express = require('express')

const app = express()
const port = 4040
const publicpath = path.join(__dirname, 'public')
const imagespath = path.join(publicpath, 'images')
const videospath = path.join(publicpath, 'videos')
const vastspath = path.join(publicpath, 'vasts')

app.use(logger('dev'));
app.use(express.static(publicpath));
app.use('/vasts', express.static(vastspath));
app.use('/images', express.static(imagespath));
app.use('/videos', express.static(videospath));

app.get('/vasts', (request, response) => response.setHeader('Access-Control-Allow-Origin', request.get('origin')));

app.listen(port, () => {
  console.log(`Example app listening at http://127.0.0.1:${port}`)
})
