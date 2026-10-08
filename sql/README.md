# SQL queries for payments analytics

Reusable SQL patterns for payments data: approval analysis, reconciliation,
duplicate detection and settlement monitoring. All data is synthetic.

## How to run

1. Create a PostgreSQL database (or use db-fiddle.com).
2. Run `00_schema.sql` and `01_sample_data.sql`.
3. Run any query from `02` to `05`.

## Queries

| File | Business question | Key SQL concepts |
|---|---|---|
| 02_approval_rate_by_country.sql | Where is the approval rate lowest? | GROUP BY, FILTER |
| 03_reconciliation_exceptions.sql | Which transactions and settlements don't match? | FULL OUTER JOIN, CTE, CASE |
| 04_duplicate_detection.sql | Are there potential duplicate charges? | LAG, PARTITION BY |
| 05_settlement_delay.sql | How long does settlement take per country? | Window AVG, date math |

## Expected results on the sample data

- 03: tx 4 (amount_mismatch), tx 8 and 9 (missing_settlement), settlement 7 (orphan_settlement).
- 04: tx 8 flagged as duplicate of tx 7.
