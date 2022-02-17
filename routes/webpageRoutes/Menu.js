var express = require('express');
var router = express.Router();
var pool = require('./../../db_config');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('Webpages/menu', { title: 'Express' });
});

module.exports = router;
