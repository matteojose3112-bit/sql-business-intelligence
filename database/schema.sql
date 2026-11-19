-- Sales analytics warehouse schema (SQLite-compatible).
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;

CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  customer_name TEXT NOT NULL,
  segment TEXT NOT NULL CHECK (segment IN ('Consumer', 'Small Business', 'Enterprise')),
  region TEXT NOT NULL,
  created_at TEXT NOT NULL
);

CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  product_name TEXT NOT NULL,
  category TEXT NOT NULL,
  unit_cost NUMERIC NOT NULL CHECK (unit_cost >= 0),
  list_price NUMERIC NOT NULL CHECK (list_price >= unit_cost)
);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES customers(customer_id),
  order_date TEXT NOT NULL,
  sales_channel TEXT NOT NULL CHECK (sales_channel IN ('Online', 'Direct', 'Partner')),
  order_status TEXT NOT NULL CHECK (order_status IN ('Completed', 'Returned', 'Cancelled'))
);

CREATE TABLE order_items (
  order_item_id INTEGER PRIMARY KEY,
  order_id INTEGER NOT NULL REFERENCES orders(order_id),
  product_id INTEGER NOT NULL REFERENCES products(product_id),
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  unit_price NUMERIC NOT NULL CHECK (unit_price >= 0),
  discount_rate NUMERIC NOT NULL DEFAULT 0 CHECK (discount_rate BETWEEN 0 AND 1)
);

CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);
