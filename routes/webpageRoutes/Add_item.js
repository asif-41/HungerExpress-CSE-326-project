var express = require('express');
var router = express.Router();
var upload = require('express-fileupload');

var restaurantBoundary = require('./../../Models/Boundary/Restaurant_Boundary');

var ImageFolder = 'C:\\Users\\Kamal\\WebstormProjects\\untitled\\public\\images\\';



/* GET home page. */
router.get('/', async function(req, res, next) {

    res.render('Webpages/Add_item',
        { title: 'Add_item',
            data: {}
        });
});


router.post('/', async function(req, res, next) {

    let inp = req.body;
    let img = req.files;

    let ret = restaurantBoundary.addItem(inp, img, 215);
    if(ret.status){
        console.log(ret);
    }
    else{
        res.render('Webpages/Add_item',
            { title: 'Add_item',
                data: { status: false }
            });
    }
});

module.exports = router;
