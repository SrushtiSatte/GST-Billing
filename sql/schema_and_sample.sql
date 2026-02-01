-- GST Billing: Schema + Sample Data
-- Import this into XAMPP/phpMyAdmin or via the mysql CLI

-- Create DB (if not already present) and select it
CREATE DATABASE IF NOT EXISTS `gst_billing` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `gst_billing`;

-- Remove existing tables (safe for re-runs)
DROP TABLE IF EXISTS `invoice_items`;
DROP TABLE IF EXISTS `invoices`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `customers`;

-- Customers
CREATE TABLE `customers` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `gstin` VARCHAR(32) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Products
CREATE TABLE `products` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `price` DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Invoices
CREATE TABLE `invoices` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT UNSIGNED NOT NULL,
  `invoice_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  `gst_amount` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  INDEX (`customer_id`),
  CONSTRAINT `fk_invoices_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Invoice items
CREATE TABLE `invoice_items` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NOT NULL DEFAULT 1,
  `price` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `amount` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  INDEX (`invoice_id`),
  INDEX (`product_id`),
  CONSTRAINT `fk_items_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices`(`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_items_product` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sample data for quick testing
-- Use variables and a transaction to ensure correct IDs across different import environments
START TRANSACTION;

-- Insert customer and capture its ID
INSERT INTO `customers` (`name`, `gstin`, `email`) VALUES ('Acme Pvt Ltd', '27AAAPL1234C1Z1', 'billing@acme.com');
SET @customer_id = LAST_INSERT_ID();

-- Insert products individually and capture their IDs
INSERT INTO `products` (`name`, `price`) VALUES ('Widget A', 499.00);
SET @product1_id = LAST_INSERT_ID();
INSERT INTO `products` (`name`, `price`) VALUES ('Service B', 1200.00);
SET @product2_id = LAST_INSERT_ID();

-- Create a sample invoice for the customer and capture invoice id
INSERT INTO `invoices` (`customer_id`, `invoice_date`, `total_amount`, `gst_amount`)
VALUES (@customer_id, NOW(), 998.00, ROUND(998.00 * 0.18, 2));
SET @invoice_id = LAST_INSERT_ID();

-- Insert invoice item using captured IDs
INSERT INTO `invoice_items` (`invoice_id`, `product_id`, `quantity`, `price`, `amount`)
VALUES (@invoice_id, @product1_id, 2, 499.00, 998.00);

COMMIT;

-- Optional verification (uncomment to run after import):
-- SELECT i.id AS invoice_id, c.name AS customer, i.total_amount, i.gst_amount
-- FROM invoices i JOIN customers c ON i.customer_id = c.id;
