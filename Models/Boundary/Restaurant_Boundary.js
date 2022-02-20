
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



async function getCategories(restaurant_id){
    let data = await RestaurantController.getCategories(restaurant_id);
    return data;
}

async function addItem(item_data, image_data, restaurant_id){
    let data = await RestaurantController.addItem(item_data, image_data, restaurant_id);
    return data;
}


async function editTable(inp_data, restaurant_id){
    let data = await RestaurantController.editTable(inp_data, restaurant_id);
    return data;
}


module.exports = {
    getAll,
    getMenu,
    getItemDetails,

    addItem,
    getCategories,
    editTable
}