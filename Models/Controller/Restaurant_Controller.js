
const SqlHelper = require("./../SQLHelper");



// let pool_data;
// pool_data = await SqlHelper.retrieve_data_conditional("restaurant", ["*"],
//     {column_name: ["id"], value: [restaurant_id], rel: ["="]} );
// let restaurant_info = pool_data.data[0];
//
// pool_data = await SqlHelper.retrieve_data_conditional("restaurant_address", ["*"],
//     {column_name: ["id"], value: [restaurant_info.current_address_id], rel: ["="]} );
// let restaurant_current_address = pool_data.data[0];
//
// pool_data = await SqlHelper.retrieve_data_conditional("restaurant_manager", ["*"],
//     {column_name: ["restaurant_id"], value: [restaurant_id], rel: ["="]} );
// let restaurant_manager = pool_data.data[0];
//
// pool_data = await SqlHelper.retrieve_data_conditional("category", ["*"],
//     {column_name: ["restaurant_id"], value: [restaurant_id], rel: ["="]} );
// let restaurant_category = pool_data.data;
//
// let items = [];
// for(let i in restaurant_category){
//     pool_data = await SqlHelper.retrieve_data_conditional("item_category", ["item_id"],
//         {column_name: ["category_id"], value: [restaurant_category[i].id], rel: ["="]} );
//
//     let item_ids = pool_data.data;
//     let item_details = [];
//     for(let j in item_ids){
//         pool_data = await SqlHelper.retrieve_data_conditional("item", ["*"],
//             {column_name: ["id"], value: [item_ids[j].item_id], rel: ["="]} );
//         item_details.push(pool_data.data[0]);
//     }
//     items.push( {category: restaurant_category[i].id, items: item_details} );
// }
//
// let addons = [];
// for(let i=0; i<items.length; i++){
//     for(let j=0; j<items[i].items.length; j++){
//         let item_id = items[i].items[j].id;
//
//         pool_data = await SqlHelper.retrieve_data_conditional("item_addon", ["addon_id"],
//             {column_name: ["item_id"], value: [item_id], rel: ["="]} );
//         let addons_id_list = pool_data.data;
//
//         let addons_temp = [];
//
//         for(let k=0; k<addons_id_list.length; k++){
//             let addon_id = addons_id_list[k].addon_id;
//
//             pool_data = await SqlHelper.retrieve_data_conditional("addon", ["*"],
//                 {column_name: ["id"], value: [addon_id], rel: ["="]} );
//             addons_temp.push(pool_data.data[0]);
//         }
//     }
// }
//
// let reviews = [];
// for(let i=0; i<items.length; i++){
//     for(let j=0; j<items[i].items.length; j++){
//         let item_id = items[i].items[j].id;
//
//         pool_data = await SqlHelper.retrieve_data_conditional("item_review", ["*"],
//             {column_name: ["item_id"], value: [item_id], rel: ["="]} );
//
//         reviews.push({item: item_id, review: pool_data.data});
//     }
// }

async function getMenu(restaurant_id){
    let pool_data;
    pool_data = await SqlHelper.retrieve_data_conditional("restaurant", ["*"],
                        {column_name: ["id"], value: [restaurant_id], rel: ["="]} );
    let restaurant_info = pool_data.data[0];

    pool_data = await SqlHelper.retrieve_data_conditional("restaurant_address", ["*"],
        {column_name: ["id"], value: [restaurant_info.current_address_id], rel: ["="]} );
    let restaurant_current_address = pool_data.data[0];

    pool_data = await SqlHelper.retrieve_data_conditional("restaurant_manager", ["*"],
        {column_name: ["restaurant_id"], value: [restaurant_id], rel: ["="]} );
    let restaurant_manager = pool_data.data[0];

    pool_data = await SqlHelper.retrieve_data_conditional("category", ["id", "name"],
        {column_name: ["restaurant_id"], value: [restaurant_id], rel: ["="]} );
    let restaurant_category = pool_data.data;

    let items = [];
    for(let i in restaurant_category){
        pool_data = await SqlHelper.retrieve_data_conditional("item_category", ["item_id"],
            {column_name: ["category_id"], value: [restaurant_category[i].id], rel: ["="]} );

        let item_ids = pool_data.data;
        let item_details = [];
        for(let j in item_ids){
            pool_data = await SqlHelper.retrieve_data_conditional("item", ["*"],
                {column_name: ["id"], value: [item_ids[j].item_id], rel: ["="]} );

            let d = pool_data.data[0];

            pool_data = await SqlHelper.retrieve_data_conditional("item_image", ["image_id"],
                {column_name: ["item_id"], value: [item_ids[j].item_id], rel: ["="]} );
            d.images = pool_data.data;

            item_details.push(d);
        }
        items.push( {category: restaurant_category[i].id, items: item_details} );
    }

    let addons = [];
    for(let i=0; i<items.length; i++){
        for(let j=0; j<items[i].items.length; j++){
            let item_id = items[i].items[j].id;

            pool_data = await SqlHelper.retrieve_data_conditional("item_addon", ["addon_id"],
                {column_name: ["item_id"], value: [item_id], rel: ["="]} );
            let addons_id_list = pool_data.data;

            let addons_temp = [];

            for(let k=0; k<addons_id_list.length; k++){
                let addon_id = addons_id_list[k].addon_id;

                pool_data = await SqlHelper.retrieve_data_conditional("addon", ["*"],
                    {column_name: ["id"], value: [addon_id], rel: ["="]} );
                addons_temp.push(pool_data.data[0]);
            }
            addons.push({item: item_id, addon: addons_temp});
        }
    }

    let reviews = [];
    for(let i=0; i<items.length; i++){
        for(let j=0; j<items[i].items.length; j++){
            let item_id = items[i].items[j].id;

            pool_data = await SqlHelper.retrieve_data_conditional("item_review", ["*"],
                {column_name: ["item_id"], value: [item_id], rel: ["="]} );

            reviews.push({item: item_id, review: pool_data.data});
        }
    }

    return {
        restaurant_info: restaurant_info,
        restaurant_current_address: restaurant_current_address,
        restaurant_manager: restaurant_manager,
        restaurant_category: restaurant_category,
        items: items,
        addons: addons,
        reviews: reviews
    };
}

module.exports = {
    getMenu
}