CREATE TABLE `customers` (
  `customer_id` varchar(255) PRIMARY KEY,
  `customer_unique_id` varchar(255),
  `customer_zip_code_prefix` varchar(255),
  `customer_city` varchar(255),
  `customer_state` varchar(255)
);

CREATE TABLE `orders` (
  `order_id` varchar(255) PRIMARY KEY,
  `customer_id` varchar(255) NOT NULL,
  `order_status` varchar(255),
  `order_purchase_timestamp` timestamp,
  `order_approved_at` timestamp,
  `order_delivered_carrier_date` timestamp,
  `order_delivered_customer_date` timestamp,
  `order_estimated_delivery_date` timestamp
);

CREATE TABLE `order_items` (
  `order_id` varchar(255) NOT NULL,
  `order_item_id` integer NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `seller_id` varchar(255) NOT NULL,
  `shipping_limit_date` timestamp,
  `price` decimal(10,2),
  `freight_value` decimal(10,2),
  PRIMARY KEY (`order_id`, `order_item_id`)
);

CREATE TABLE `products` (
  `product_id` varchar(255) PRIMARY KEY,
  `product_category_name` varchar(255),
  `product_name_lenght` integer,
  `product_description_lenght` integer,
  `product_photos_qty` integer,
  `product_weight_g` integer,
  `product_length_cm` integer,
  `product_height_cm` integer,
  `product_width_cm` integer
);

CREATE TABLE `sellers` (
  `seller_id` varchar(255) PRIMARY KEY,
  `seller_zip_code_prefix` varchar(255),
  `seller_city` varchar(255),
  `seller_state` varchar(255)
);

CREATE TABLE `order_payments` (
  `order_id` varchar(255) NOT NULL,
  `payment_sequential` integer NOT NULL,
  `payment_type` varchar(255),
  `payment_installments` integer,
  `payment_value` decimal(10,2),
  PRIMARY KEY (`order_id`, `payment_sequential`)
);

CREATE TABLE `order_reviews` (
  `review_id` varchar(255) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `review_score` integer,
  `review_comment_title` varchar(255),
  `review_comment_message` text,
  `review_creation_date` timestamp,
  `review_answer_timestamp` timestamp,
  PRIMARY KEY (`review_id`, `order_id`)
);

CREATE TABLE `geolocation` (
  `geolocation_zip_code_prefix` varchar(255),
  `geolocation_lat` double,
  `geolocation_lng` double,
  `geolocation_city` varchar(255),
  `geolocation_state` varchar(255)
);

CREATE TABLE `product_category_name_translation` (
  `product_category_name` varchar(255) PRIMARY KEY,
  `product_category_name_english` varchar(255)
);

ALTER TABLE `geolocation` COMMENT = 'Sem chave primária: o prefixo de CEP repete';

CREATE TABLE `geolocation_customers` (
  `geolocation_geolocation_zip_code_prefix` varchar,
  `customers_customer_zip_code_prefix` varchar,
  PRIMARY KEY (`geolocation_geolocation_zip_code_prefix`, `customers_customer_zip_code_prefix`)
);

ALTER TABLE `geolocation_customers` ADD FOREIGN KEY (`geolocation_geolocation_zip_code_prefix`) REFERENCES `geolocation` (`geolocation_zip_code_prefix`);

ALTER TABLE `geolocation_customers` ADD FOREIGN KEY (`customers_customer_zip_code_prefix`) REFERENCES `customers` (`customer_zip_code_prefix`);


ALTER TABLE `orders` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

ALTER TABLE `order_items` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

ALTER TABLE `order_items` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `order_items` ADD FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`);

ALTER TABLE `products` ADD FOREIGN KEY (`product_category_name`) REFERENCES `product_category_name_translation` (`product_category_name`);

CREATE TABLE `geolocation_sellers` (
  `geolocation_geolocation_zip_code_prefix` varchar,
  `sellers_seller_zip_code_prefix` varchar,
  PRIMARY KEY (`geolocation_geolocation_zip_code_prefix`, `sellers_seller_zip_code_prefix`)
);

ALTER TABLE `geolocation_sellers` ADD FOREIGN KEY (`geolocation_geolocation_zip_code_prefix`) REFERENCES `geolocation` (`geolocation_zip_code_prefix`);

ALTER TABLE `geolocation_sellers` ADD FOREIGN KEY (`sellers_seller_zip_code_prefix`) REFERENCES `sellers` (`seller_zip_code_prefix`);


ALTER TABLE `order_payments` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

ALTER TABLE `order_reviews` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
