const mongoose = require('mongoose')

const UserSchema = new mongoose.Schema({
    username: {type:String, unique: true, required: true},
    password: {type:String, required: true},
    email: {type:String, unique: true, required: true},
    phone: {type:Number, unique: true, required: true}, 
    photo: {type:String,  default: null},
    blooodGroup: {type:String,  default: null},
    raltivePhone:  {type:Number, unique: true, required: true}
})

module.exports = mongoose.model('User',UserSchema);