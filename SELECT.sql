SELECT products.id, reviews.description
FROM products
INNER JOIN reviews
ON products.id = reviews.product_id;

SELECT customers.id, customers.last_name, returnRequest.reason
FROM customers
LEFT JOIN returnRequest
ON customers.id = returnRequest.customer_id; 

SELECT orders.order_date, customers.id
FROM orders
RIGHT JOIN customers
ON orders.customer_id = customers.id;

SELECT orders.id, orderDetails.quantity, orderDetails.total_price
FROM orders
LEFT JOIN orderDetails
ON orders.id = orderDetails.order_id;

SELECT MAX(order_date) AS last_order_date
FROM orders;

SELECT MIN(order_date) AS the_first_order_date
FROM orders;

SELECT COUNT(id) AS amount_of_orders
FROM orders;

SELECT AVG(price) AS average_product_price
FROM products;

SELECT SUM(total_price) AS total_price
FROM orderDetails;

SELECT MIN(quantity) AS smallest_order
FROM orderDetails;

SELECT MIN(last_name) AS the_shortest_last_name
FROM customers;

SELECT SUM(total_price) AS total_price, customers.id
FROM orderDetails
INNER JOIN orders
ON orders.id = orderDetails.order_id 
JOIN customers
ON orders.customer_id = customers.id
GROUP BY customers.id
HAVING customers.id = 6;

SELECT COUNT(orders.id) AS orders_per_customer, customers.id
FROM orders
LEFT JOIN customers
ON orders.customer_id = customers.id 
GROUP BY customers.id
HAVING customers.id <= 6;

SELECT order_id, AVG(total_price) AS average_total_price
FROM orderDetails
GROUP BY order_id
HAVING order_id < 10;

SELECT customer_id, MAX(date) AS latest_return_date
FROM returnRequest
GROUP BY customer_id
HAVING customer_id = 3;

SELECT name, MIN(start_date) AS earliest_start_date
FROM discounts
GROUP BY name
HAVING COUNT(name) > 1;

SELECT *
FROM onlineShop 
JOIN categories ON onlineShop.id = categories.onlineShop_id
JOIN discounts ON onlineShop.id = discounts.id
JOIN brands ON brands.discount_id = discounts.id
JOIN deliveries ON deliveries.id = onlineShop.id
JOIN customers ON customers.id = onlineShop.id
JOIN orders ON orders.customer_id = customers.id
JOIN orderDeliveries ON orderDeliveries.order_id = orders.id
JOIN products ON products.brand_id = brands.id
JOIN payments ON payments.order_id = orders.id
JOIN reviews ON reviews.product_id = products.id
JOIN returnRequest ON returnRequest.customer_id = customers.id
JOIN orderDetails ON orderDetails.order_id = orders.id;