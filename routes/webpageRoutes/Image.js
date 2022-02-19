var express = require('express');
var router = express.Router();

var ImageFolder = 'C:\\Users\\Kamal\\WebstormProjects\\untitled\\public\\images\\';


/* GET home page. */
router.get('/', function(req, res, next) {

    let path = ImageFolder + req.query.id + ".png";
    res.sendFile(path);
});

module.exports = router;
