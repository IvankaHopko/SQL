
ALTER TABLE onlineShop
DROP COLUMN opening_time;

ALTER TABLE onlineShop
DROP COLUMN closing_time;

ALTER TABLE onlineShop
ADD COLUMN opening_time TIME;

ALTER TABLE onlineShop
ADD COLUMN closing_time TIME;

ALTER TABLE onlineShop
DROP COLUMN phone_number;

ALTER TABLE onlineShop
ADD COLUMN phone_number VARCHAR(20);

ALTER TABLE discounts
ADD COLUMN discount_amount VARCHAR(10);

INSERT INTO onlineShop(name, staff, address, email, phone_number, opening_time, closing_time) VALUES 
("DressUp", 50, "Ukraine", "dressUp#1@gmail.com", '123-324', '09:00:00', '20:00:00');

INSERT INTO categories(name, onlineShop_id) VALUES
("New", 2),
("Dresses", 2),
("Jeans", 2),
("Jackets", 2),
("Sweaters", 2);

INSERT INTO discounts(name, start_date, end_date) VALUES
("Christmas gift", '2023-12-24', '2023-12-25'),
("Winter sale", '2024-03-01', '2024-03-14'),
("Summer sale", '2024-09-02', '2024-09-08');

INSERT INTO brands(name, on_sale, discount_id) VALUES
("Zara", true, 5),
("Tom Ford", false, null),
("Balenciaga", true, 6),
("Max Mara", true, 4),
("Versace", false, null);

INSERT INTO deliveries(delivery_type, status) VALUES 
("From-storage-to-doors", "available"),
("From-storage-to-storage", "available"),
("Quick delivery", "unavailable"),
("On hold", "unavailable");

INSERT INTO customers(first_name, last_name, email, phone_number) VALUES 
("Mike", "Roberts", "mikeR@gmail.com", '789-456'),
("Emily", "Rogers", "EmRog@gmail.com", '456-123'),
("Matthew", "Blanc", "blankMan67@gmail.com", '789-123'),
("Chris", "Cornell", "chrisCo#1@gmail.com", '963-258'),
("Tony", "Stark", "Stark^Expo@gmail.com", '741-369'),
("Mandy", "Moore", "Ma&Moo@gmail.com", '986-264'),
("Prue", "Pendrell", "PPend@gmail.com", '258-369');

INSERT INTO orders(order_date, status, customer_id) VALUES
('2021-12-26 17:26:03', "done", 5),
('2023-05-02 07:35:12', "done", 7),
('2020-03-02 10:16:59', "declined", 3),
('2021-10-25 17:25:26', "done", 6),
('2023-04-10 16:19:25', "done", 2),
('2022-07-29 12:12:42', "pending", 1),
('2020-06-19 18:06:36', "done", 4),
('2023-08-15 19:08:41', "done", 3),
('2023-09-19 02:15:56', "done", 6),
('2022-11-30 14:07:15', "done", 7),
('2021-02-28 13:16:34', "declined", 5),
('2020-10-19 14:17:45', "done", 4),
('2022-07-16 23:18:00', "done", 2),
('2021-06-15 08:41:24', "done", 1),
('2023-12-17 10:10:53', "pending", 6),
('2020-05-18 21:12:29', "done", 2),
('2022-02-14 12:16:51', "done", 7),
('2021-11-08 15:15:49', "declined", 4),
('2020-09-14 09:15:26', "done", 5),
('2023-04-10 05:15:47', "done", 3),
('2023-12-19 14:48:5', "pending", 1);

INSERT INTO orderDeliveries(country, city, street, building, postal_code, order_id, delivery_id) VALUES
("Ukraine", "Chernivtsi", "Holovna", 200, 58000, 5, 2),
("Ukraine", "Kharkiv", "Mizhnarodna", 46, 61001, 7, 4),
("Poland", "Warsaw", "Dolna", 17, 02595, 17, 1);

INSERT INTO products (name, price, description, in_stock, brand_id) VALUES
("blouse", 120, "elegant", TRUE, 5),
("Skirt", 180, "unisex", TRUE, 1),
("Dress", 350, "stylish", FALSE, 2),
("leggins", 400, "comfortable", TRUE, 4),
("cardigan", 150, "cozy", FALSE, 3),
("Jumpsuit", 260, "trendy", TRUE, 1),
("tunic", 90, "flowy", TRUE, 1),
("romper", 600, "playful", TRUE, 2);

INSERT INTO payments(payment_method, date, status, order_id) VALUES
("credit card", '2021-12-26 17:26:03', "approved", 5),
("debit card", '2023-08-15 19:08:41', "approved", 3),
("payPal", '2022-07-29 12:12:42', "pending", 1),
("bank transfer", '2021-11-08 15:15:49', "canceled", 4);

INSERT INTO reviews(rate, date, description, product_id) VALUES
(5, '2023-08-15 19:08:41', "satisfied", 3),
(2, '2023-08-15 19:08:41', "doesn't fit", 4),
(5, '2022-11-30 14:07:15', "excellent", 7);

INSERT INTO returnRequest (reason, date, status, customer_id) VALUES
("wrong size", '2022-11-30 14:07:15', "success", 4),
("I don't like", '2023-08-15 19:08:41', "declined", 6),
("the colour is different", '2021-06-15 08:41:24', "success", 3),
("changed my mind", '2023-04-10 05:15:47', "in progress", 2);

INSERT INTO orderDetails(quantity, total_price, order_id, product_id, payment_id, delivery_id) VALUES
(2, 800, 2, 4, 3, 1),
(1, 350, 4, 3, 2, 4),
(3, 450, 9, 5, 1, 1);

UPDATE discounts
SET discount_amount = '25%'
WHERE id = 4;

UPDATE discounts
SET discount_amount = '15%'
WHERE id = 5;

UPDATE discounts
SET discount_amount = '10%'
WHERE id = 6;

UPDATE reviews
SET description = "not bad"
WHERE id = 3;

UPDATE returnRequest
SET status = "success"
WHERE id = 4;

UPDATE customers
SET last_name = "Perry", email = "ChenPer111@gmail.com"
WHERE id = 1;

UPDATE products
SET price = 320
WHERE id = 3;

UPDATE payments
SET status = "approved"
WHERE id = 4;

UPDATE orderDeliveries
SET country = "USA", city = "Chicago", street = "St. George", building = 35, postal_code = 56239
WHERE id = 2;

UPDATE onlineShop
SET opening_time = '10:00:00', closing_time = '21:00:00'
WHERE id = 2;

DELETE
FROM orders
WHERE id > 20;

DELETE
FROM orderDeliveries
WHERE id = 3;

DELETE
FROM returnRequest
WHERE id = 4;

DELETE
FROM reviews
WHERE id < 2;