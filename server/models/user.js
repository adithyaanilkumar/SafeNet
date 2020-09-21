const mongoose = require('mongoose')

const UserSchema = new mongoose.Schema({
    username: {type:String, unique: true, required: true},
    password: {type:String, required: true},
    email: {type:String, unique: true, required: true},
    photo: {type:String,  default: null},
})

module.exports = mongoose.model('User',UserSchema);