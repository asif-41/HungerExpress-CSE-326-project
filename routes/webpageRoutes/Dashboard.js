var express = require('express');
var router = express.Router();
var pool = require('./../../db_config');

// var AddOn = require('./../../Models/Entity/addon');
// var Address = require('./../../Models/Entity/address');
// var Admin = require('./../../Models/Entity/admin');
//  var Cart = require('./../../Models/Entity/cart');
//  var CartItem = require('./../../Models/Entity/cart_item');
//  var CartItemAddon = require('./../../Models/Entity/cart_item_addon');
//  var Category = require('./../../Models/Entity/category');
//  var CoinHistory = require('./../../Models/Entity/coin_history');
//  var CoinUseType = require('./../../Models/Entity/coin_use_type');
//  var Customer = require('./../../Models/Entity/customer');
//  var CustomerAddress = require('./../../Models/Entity/customer_address');
//  var CustomerImage = require('./../../Models/Entity/customer_image');
 var DeliveryAddress = require('./../../Models/Entity/delivery_address');

/* GET home page. */
router.get('/', async function(req, res, next) {

  var data = await pool.query('SELECT * FROM delivery_address');


  var array = DeliveryAddress.createArrayFromJson(data.rows);
  for(let i=0; i<array.length; i++){
    console.log(array[i].getJson());
  }

  array[0].setId("haha");


  for(let i=0; i<array.length; i++){
    console.log(array[i].getJson());
  }



  // var addon1 = AddOn.create();
  //
  // addon1.setId(100);
  // console.log(addon1);
  // console.log(addon1.getId());
  // console.log(addon1.getName());
  // console.log(addon1.getPrice());
  // console.log(addon1.getCount());
  //
  // var addon2 = AddOn.createFromJson(data.rows[0]);
  // var addon3 = AddOn.createFromJson(data.rows[1]);
  //
  // console.log(addon2);
  // console.log(addon2.getId());
  // console.log(addon2.getName());
  // console.log(addon2.getPrice());
  // console.log(addon2.getCount());
  //
  //
  // console.log(addon3);
  // console.log(addon3.getId());
  // console.log(addon3.getName());
  // console.log(addon3.getPrice());
  // console.log(addon3.getCount());
  //
  // var addon4 = AddOn.createArrayFromJson(data.rows);
  // console.log(addon4[1].toString());
  // addon4[1].setId(25);
  //
  // for(let i=0; i<addon4.length; i++){
  //   console.log(addon4[i].toString());
  //   console.log(addon4[i].getJson());
  // }


  res.render('Webpages/dashboard', { title: 'Express' });
});

module.exports = router;
