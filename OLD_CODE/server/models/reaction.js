const mongoose = require('mongoose')

const ReactionSchema = new mongoose.MongooseDocument.Schema({
    user: {type:String},
    post:{
        type:mongoose.Schema.Types.ObjectId,
        ref: 'Post'
    },
    like: {type:Boolean,default:null}
})

module.exports = mongoose.model('Reaction',UserSchema);