#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DB="$(mktemp)"
trap 'rm -f "$DB"' EXIT

sqlite3 "$DB" < "$ROOT/database/schema.sql"
sqlite3 "$DB" < "$ROOT/database/seed.sql"

assert_eq() {
  local actual="$1" expected="$2" label="$3"
  if [[ "$actual" != "$expected" ]]; then
    echo "FAIL: $label (expected $expected, got $actual)" >&2
    exit 1
  fi
  echo "PASS: $label"
}

assert_eq "$(sqlite3 "$DB" 'SELECT COUNT(*) FROM customers;')" "8" "customer seed count"
assert_eq "$(sqlite3 "$DB" 'SELECT COUNT(*) FROM products;')" "5" "product seed count"
assert_eq "$(sqlite3 "$DB" 'SELECT COUNT(*) FROM orders;')" "18" "order seed count"
assert_eq "$(sqlite3 "$DB" 'SELECT COUNT(*) FROM order_items;')" "22" "order item seed count"
assert_eq "$(sqlite3 "$DB" 'PRAGMA foreign_key_check;' | wc -l | tr -d ' ')" "0" "foreign key integrity"

monthly_rows="$(sqlite3 "$DB" < "$ROOT/queries/sales_performance.sql" | wc -l | tr -d ' ')"
if (( monthly_rows < 10 )); then
  echo "FAIL: monthly performance query returned only $monthly_rows rows" >&2
  exit 1
fi
echo "PASS: monthly performance query ($monthly_rows months)"

product_rows="$(sqlite3 "$DB" < "$ROOT/queries/product_performance.sql" | wc -l | tr -d ' ')"
if (( product_rows < 4 )); then
  echo "FAIL: product performance query returned only $product_rows rows" >&2
  exit 1
fi
echo "PASS: product performance query ($product_rows products)"

total_revenue="$(sqlite3 "$DB" "SELECT ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_rate)), 2) FROM orders o JOIN order_items oi USING(order_id) WHERE o.order_status='Completed';")"
if ! awk -v value="$total_revenue" 'BEGIN { exit !(value > 0) }'; then
  echo "FAIL: completed-order revenue must be positive" >&2
  exit 1
fi
echo "PASS: completed-order revenue is positive ($total_revenue)"

echo "All SQL warehouse checks passed."
