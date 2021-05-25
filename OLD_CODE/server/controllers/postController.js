const Post = require('../models/post')
const User = require('../models/user');

module.exports = {
    create : async (req, res) => {
        console.log(req.params);
        user = req.params;
        id = user.id;
        const { title, subtitle} = req.body;
        const post = await Post.create({
            title,
            subtitle,
            user:id
        });
        await post.save();
        return res.send(post);
    },
    userByPost : async (req,res)=>{
        const { id } = req.params;
        const userByPost = await Post.findById(id).populate('user');
        res.send(userByPost);
    }
}
