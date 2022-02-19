
const RestaurantController = require("./../Controller/Restaurant_Controller");

async function getAll(restaurant_id) {
    let data = await RestaurantController.getAll(restaurant_id);
    return data;
}

async function getMenu(category_id, restaurant_id) {
    let data = await RestaurantController.getMenu(category_id, restaurant_id);
    return data;
}

async function getItemDetails(item_id, restaurant_id){
    let data = await RestaurantController.getItemDetails(item_id, restaurant_id);
    return data;
}

module.exports = {
    getAll,
    getMenu,
    getItemDetails
}