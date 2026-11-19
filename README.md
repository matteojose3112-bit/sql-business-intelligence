# SQL Business Intelligence

> A synthetic retail sales warehouse, reusable SQL analysis, and a browser-based business intelligence showcase.

**Status:** SQL analytics MVP implemented; CI validation passed; public deployment pending  
**Primary language:** SQL (SQLite-compatible)  
**Validation:** Python standard-library `unittest` + SQLite  
**Dashboard:** Static HTML, CSS, and JavaScript  
**Live demo:** Pending GitHub Pages activation and deployment

## Overview

Signal BI demonstrates how a normalized relational dataset can support practical management reporting. The project models customers, products, orders, and order items, then uses analytical SQL to calculate sales performance, customer value, product contribution, and channel/region mix.

All records and values are fictional and are intended only for portfolio demonstration.

## Implemented capabilities

- Relational schema with primary keys, foreign keys, checks, and reporting indexes.
- Synthetic seed dataset with 8 customers, 5 products, 18 orders, and 22 order-item rows.
- Monthly revenue, average order value, gross profit, and gross-margin analysis.
- Customer lifetime revenue and repeat-purchase segmentation.
- Product revenue, units sold, and gross-profit analysis.
- Sales channel and regional contribution analysis.
- Responsive static dashboard with period filter, KPI cards, monthly revenue bars, channel mix, and product table.
- Automated SQLite validation tests for referential integrity, seed counts, and analytics queries.
- GitHub Actions workflows for SQL validation and GitHub Pages deployment.

## Project structure

```text
sql-business-intelligence/
├── .github/workflows/
│   ├── ci.yml
│   └── deploy.yml
├── database/
│   ├── schema.sql
│   └── seed.sql
├── queries/
│   ├── sales_performance.sql
│   ├── customer_analysis.sql
│   ├── product_performance.sql
│   └── channel_region.sql
├── tests/test_sql.py
├── dashboard/
│   ├── index.html
│   ├── styles.css
│   └── dashboard.js
├── README.md
├── ROADMAP.md
└── CHANGELOG.md
```

## Run locally

Requires Python 3.12+ and SQLite (included with Python).

Run the validation suite:

```bash
python -m unittest discover -s tests -v
```

Load the schema and sample data into a local SQLite database:

```bash
sqlite3 sales.db < database/schema.sql
sqlite3 sales.db < database/seed.sql
sqlite3 sales.db < queries/sales_performance.sql
```

Open `dashboard/index.html` in a browser to explore the static dashboard.

## Data model and assumptions

- Revenue is calculated as quantity × unit price × (1 − discount rate).
- Gross profit subtracts the product's unit cost from discounted selling price.
- Returned and cancelled orders are excluded from sales-performance queries.
- Currency values are illustrative USD amounts, not actual company results.
- The dashboard uses a curated synthetic summary aligned to the sample business scenario; SQL files are the reproducible source for detailed analysis.

## Deployment

The static dashboard is configured for GitHub Pages through GitHub Actions. The deployment workflow is in place, but the repository's Pages environment must be enabled with **GitHub Actions** as its source before the public URL can be confirmed.

The live URL and successful deployment run will be added here after activation and verification.

## Quality checks

GitHub Actions SQL validation passed on the latest documentation commit. Pages deployment remains blocked until the repository Pages site is enabled with GitHub Actions as its source.

## Roadmap and changelog

- [Roadmap](ROADMAP.md)
- [Changelog](CHANGELOG.md)

## Portfolio capabilities demonstrated

Relational data modeling, SQL joins and aggregations, KPI definitions, customer segmentation, query validation, data integrity constraints, synthetic data design, and translating analytical outputs into a clear business dashboard.

## Limitations

- The dashboard is a static portfolio presentation; it does not connect to a live database.
- The dataset is small and synthetic, not statistically representative.
- No authentication, user roles, scheduled ETL, or production data pipeline is included.
