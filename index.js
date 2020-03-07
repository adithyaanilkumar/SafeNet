let express = require('express')
const MongoClient = require('mongodb').MongoClient
let app = express();// Setup server port
var port = process.env.PORT || 8080;// Send message for default URL
let bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: true }));
app.get('/', (req, res) => res.send('LoRi Node Server for restful Api'));// Launch app to listen to specified port
app.listen(port, function () {
     console.log("Running RestHub on port " + port);
});


 var db

MongoClient.connect('mongodb+srv://adi:adi@lori-ebbbl.mongodb.net/test?retryWrites=true&w=majority', (err, client) => {
  if (err) return console.log(err)
  db = client.db('lori') // whatever your database name is
  app.listen(3000, () => {
    console.log('listening on 3000')
  })
})
//let apiRoutes = require("./api-routes")// Use Api routes in the App
//app.use('/api', apiRoutes)
app.post('/post', function (req,res){
     db.collection('lori').save(req.body, (err, result) => {
         if (err) return console.log(err)
      
          res.send('saved to database'+req.body)
          //res.redirect('/')
        })
 })
app.get('/get', function (req, res) {
     db.collection('quotes').find().toArray(function(err, results) {
          res.send(results)
          // send HTML file populated with quotes here
        })
 });

 