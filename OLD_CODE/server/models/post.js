const mongoose = require('mongoose')

const PostSchema = new mongoose.Schema({
    username: {type:String, required: true},
    photo : {typr:String},
    name: {type:String, required: true},
    title: {type:String,  required: true},
    date_created : {type:String, default: Date.now },
    likes : {type: Number},
    dislikes : {type: Number}
})

module.exports = mongoose.model('Post',PostSchema);

