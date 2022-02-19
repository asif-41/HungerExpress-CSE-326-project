var express = require('express');
var router = express.Router();

var restaurantBoundary = require('./../../Models/Boundary/Restaurant_Boundary');

/* GET home page. */
router.get('/', async function(req, res, next) {

  let data = await restaurantBoundary.getMenu(215);

  res.render('Webpages/Edit',
      { title: 'Edit',
               data: data
      });
});

module.exports = router;
