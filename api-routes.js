// Filename: api-routes.js
// Initialize express router
let router = require('express').Router();
// Set default API response
let bodyParser = require('body-parser');
router.use(bodyParser.urlencoded({ extended: true }));
dat={
    "lat":"00",
    "long":"00"
};

router.get('/get', function (req, res) {
    res.json(dat);
});

router.post('/post', function (req,res){
        console.log(req.body);
        var h=req.body.lat;
        var g=req.body.long;
})
// Export API routes
module.exports = router;