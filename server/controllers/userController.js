const User = require('../models/user')

module.exports = {
    signup : async (req, res, next) =>{
        // const { username, email, password } = req.body;
        // const user = await User.create({
        //     name,
        //     bio,
        //     website
        //})

        //return res.send(user)
        console.log("in signup");
        return res.send("<h1>hellooooo</h1>");
    },

    signin : async (req, res,next) => {
        // const user = await User.find()
        // return res.send(user)
        return res.send({"hi":"signin"});
    },
    secret    : async (req, res, next) => {
    //    const { id } = req.params;
    //    const user = await User.findById(id).populate('posts');

    //     res.send(user.posts);
        return res.send({"hi":"secret"});
    }
}
