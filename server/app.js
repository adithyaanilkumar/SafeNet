var http = require("http");
var express = require("express");
var consolidate = require("consolidate"); 
var _ = require("underscore");
var bodyParser = require('body-parser');

var routes = require('./routes'); 
var mongoClient = require("mongodb").MongoClient;

var app = express();
app.use(bodyParser.urlencoded({
    extended: true,
}));

app.use(bodyParser.json({
    limit: '5mb'
}));

app.set('views', 'views'); 
app.use(express.static('./public')); 

app.set('view engine', 'html');
app.engine('html', consolidate.underscore); 

var server = http.Server(app);
var portNumber = 8000; 

var io = require('socket.io')(server); 

server.listen(portNumber, function() {
    console.log('Server listening at port ' + portNumber);

    var url = ''; 
    mongoClient.connect(url, function(err, db) { 
        if(err)
        {
            console.log("unable to connect to db");
            console.log(err);
            return;
        }
        db = db.db('safenet')
        console.log("Connected to Database");
        // db.collection("policeData").findOne({
        //     userId: "02"
        // }, function(err, results) {
        //     if (err) {
        //         console.log("error in db")
        //         console.log(err)
        //     } else {
        //         console.log("result")
        //         console.log(results)
        //     }
        // });
        app.get('/citizen.html', function(req, res) { 
            res.render('citizen.html', {
                userId: req.query.userId
            });
        });

        app.get('/cop.html', function(req, res) {
            res.render('cop.html', {
                userId: req.query.userId
            });
        });

        app.get('/data.html', function(req, res) {
            res.render('data.html');
        });
        app.get('/hi', function(req, res) {
            res.json('hello');
        });

        io.on('connection', function(socket) { 
            console.log('A user just connected');

            socket.on('join', function(data) { 
                socket.join(data.userId); 
                console.log("User joined room: " + data.userId);
            });

            routes.initialize(app, db, socket, io); 
        });
    });
});

