# Changelog

All notable changes to this project are documented here.

## [Unreleased] — SQL analytics MVP

### Added
- SQLite-compatible relational schema for customers, products, orders, and order items.
- Synthetic seed dataset with 8 customers, 5 products, 18 orders, and 22 order-item rows.
- Monthly sales, average order value, gross-profit, and gross-margin query.
- Customer lifetime value and repeat-purchase segmentation query.
- Product performance and profitability query.
- Sales channel and regional contribution query.
- Static Signal BI dashboard with KPI cards, period filter, revenue trend, channel mix, and product table.
- SQLite CLI and Bash validation suite.
- GitHub Actions workflows for SQL validation and GitHub Pages deployment.

### Changed
- Replaced the Python-based test harness with native SQLite CLI checks orchestrated by Bash, keeping SQL as the clear primary project language.
- Added GitHub Linguist configuration to emphasize the SQL core rather than the dashboard presentation layer.

### Verified
- Earlier SQL validation workflow passed for the warehouse schema and analytics queries.

### Pending verification
- New SQLite CLI validation workflow after removing Python test tooling.
- GitHub Pages activation and public deployment.
- Browser acceptance check of the deployed dashboard.
