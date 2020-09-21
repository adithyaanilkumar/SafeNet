const express = require('express');
const path = require('path');
require('dotenv').config()

//const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const cors = require("cors");
const cookieParser = require("cookie-parser");
const passport = require('passport')
const LocalStrategy = require('passport-local')

const userRoute = require('./routes/user')

const app = express();
app.use(cors());

app.use(cookieParser());
app.use(express.json());
mongoose.set('useNewUrlParser', true);
mongoose.set('useFindAndModify', false);
mongoose.set('useCreateIndex', true);
mongoose.set('useUnifiedTopology', true);

const Database_url = "mongodb+srv://Adithya:adithya123@cluster0.gmrxd.gcp.mongodb.net/ipl?retryWrites=true&w=majority"
mongoose.connect(Database_url, {

}).then(()=>{
     console.log("connected to DB");
}).catch(err=>{
    console.log("Error",err.message)
})


app.use('/user',userRoute); 
app.use('/admin',(req,res,next)=>{
    res.send("<h1>hello world</h1>");
});

app.use((req,res,next)=>{
    res.status(404).send("<h1>404 Not Found </h1>");
});

const port = process.env.PORT || 8000;
app.listen(port);