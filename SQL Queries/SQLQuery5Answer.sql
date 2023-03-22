SELECT products.product_id, products.product_name, COUNT(shop_id) AS num_shop
FROM products, products_in_shops, makers 
WHERE makers.maker_name = 'Samsung' AND products.product_id = products_in_shops.product_id
		AND makers.maker_id = products.maker_id
GROUP BY products.product_id, products.product_name;