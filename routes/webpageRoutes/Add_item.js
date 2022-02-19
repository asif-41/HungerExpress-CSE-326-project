var express = require('express');
var router = express.Router();
var upload = require('express-fileupload');

var restaurantBoundary = require('./../../Models/Boundary/Restaurant_Boundary');

/* GET home page. */
router.get('/', async function(req, res, next) {
    let data = {};
    res.render('Webpages/Add_item',
        { title: 'Add_item',
            data: data
        });
});


router.post('/', async function(req, res, next) {



    let inp = req.body;
    console.log("Ekhane ashchhe!");
    console.log(inp);
    console.log(inp.image);
    //console.log(req);

    let data = {};
    res.render('Webpages/Add_item',
        { title: 'Add_item',
            data: data
        });
});

module.exports = router;
