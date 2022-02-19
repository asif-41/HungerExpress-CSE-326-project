
const RestaurantController = require("./../Controller/Restaurant_Controller");

async function getMenu(restaurant_id) {
    let data = await RestaurantController.getMenu(restaurant_id);
    return data;
}

module.exports = {
    getMenu
}