import sqlite3
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

class SalesWarehouseTests(unittest.TestCase):
    def setUp(self):
        self.db = sqlite3.connect(":memory:")
        self.db.executescript((ROOT / "database/schema.sql").read_text())
        self.db.executescript((ROOT / "database/seed.sql").read_text())

    def tearDown(self):
        self.db.close()

    def test_seed_integrity(self):
        self.assertEqual(self.db.execute("SELECT COUNT(*) FROM customers").fetchone()[0], 8)
        self.assertEqual(self.db.execute("SELECT COUNT(*) FROM orders").fetchone()[0], 18)
        self.assertEqual(self.db.execute("SELECT COUNT(*) FROM order_items").fetchone()[0], 22)

    def test_foreign_keys_and_nonnegative_sales(self):
        self.db.execute("PRAGMA foreign_keys = ON")
        violations = self.db.execute("PRAGMA foreign_key_check").fetchall()
        self.assertEqual(violations, [])
        revenue = self.db.execute("""
            SELECT SUM(oi.quantity * oi.unit_price * (1 - oi.discount_rate))
            FROM orders o JOIN order_items oi USING(order_id)
            WHERE o.order_status = 'Completed'
        """).fetchone()[0]
        self.assertGreater(revenue, 0)

    def test_monthly_query_returns_rows(self):
        sql = (ROOT / "queries/sales_performance.sql").read_text()
        rows = self.db.execute(sql).fetchall()
        self.assertGreaterEqual(len(rows), 10)
        self.assertTrue(all(row[2] >= 0 for row in rows))

    def test_product_query_totals(self):
        rows = self.db.execute((ROOT / "queries/product_performance.sql").read_text()).fetchall()
        self.assertGreaterEqual(len(rows), 4)
        self.assertEqual(sum(row[3] for row in rows), 37)

if __name__ == "__main__":
    unittest.main()
