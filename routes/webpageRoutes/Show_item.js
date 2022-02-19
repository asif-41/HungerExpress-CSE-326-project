var express = require('express');
var router = express.Router();

var restaurantBoundary = require('./../../Models/Boundary/Restaurant_Boundary');

/* GET home page. */
router.get('/', async function(req, res, next) {

  let data = await restaurantBoundary.getItemDetails(215);

  res.render('Webpages/Show_item',
      { title: 'Show_item',
               data: data
      });
});

module.exports = router;
