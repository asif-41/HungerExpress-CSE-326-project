var express = require('express');
var router = express.Router();
var upload = require('express-fileupload');

var restaurantBoundary = require('./../../Models/Boundary/Restaurant_Boundary');

var ImageFolder = 'C:\\Users\\Kamal\\WebstormProjects\\untitled\\public\\images\\';



/* GET home page. */
router.get('/', async function(req, res, next) {

    let data = await restaurantBoundary.getCategories(215);

    res.render('Webpages/Add_item',
        { title: 'Add_item',
            data: data
        });
});


router.post('/', async function(req, res, next) {

    let inp = req.body;
    let img = req.files;
    let ret = await restaurantBoundary.addItem(inp, img, 215);

    if(ret.status){
        res.render('Webpages/Add_item_response',
            { title: 'Add_item_response',
                item_id: ret.item_id,
                item_name: ret.item_name
            });
    }
    else{
        res.render('Webpages/Add_item',
            { title: 'Add_item',
                data: { status: false }
            });
    }
});

module.exports = router;
