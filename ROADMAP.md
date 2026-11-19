# Roadmap

Items are complete only when implemented and verified.

## Phase 1 — Data foundation

- [x] Define the retail sales analytics scenario.
- [x] Create relational tables for customers, products, orders, and order items.
- [x] Add primary keys, foreign keys, check constraints, and reporting indexes.
- [x] Seed the database with synthetic sample records.
- [x] Document business assumptions and revenue/profit definitions.

## Phase 2 — Analytical SQL

- [x] Write monthly sales and gross-margin analysis.
- [x] Write customer lifetime value and repeat-purchase segmentation.
- [x] Write product performance and profitability analysis.
- [x] Write channel and regional contribution analysis.
- [ ] Pass automated validation suite on the latest commit.
- [ ] Review query outputs against documented business assumptions.

## Phase 3 — Public demonstration

- [x] Build responsive static dashboard with period filter and KPI cards.
- [x] Add monthly revenue, channel mix, and product performance views.
- [x] Configure GitHub Actions deployment workflow.
- [ ] Enable GitHub Pages with GitHub Actions as the source in repository settings.
- [ ] Complete a successful Pages deployment.
- [ ] Publish and verify the live URL.
- [ ] Add screenshots and a short walkthrough.

## Phase 4 — Quality and expansion

- [ ] Add a documented data dictionary and ER diagram.
- [ ] Add further data-quality checks and edge-case tests.
- [ ] Add cohort and retention analysis.
- [ ] Add query-plan and indexing notes for larger datasets.
- [ ] Consider a scheduled ingestion/refresh pipeline.
- [ ] Tag a stable release after acceptance checks pass.

## Definition of done

- A new user can reproduce the schema, seed data, and analysis locally.
- Core data assumptions and SQL outputs are documented.
- Automated tests pass.
- The public dashboard is deployed and verified.
- All sample data is synthetic and no private information or credentials are committed.
