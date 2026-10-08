
-- Goal: flag possible duplicate transactions
-- (same merchant, method and amount within 2 minutes).
-- Skills: window functions (LAG), PARTITION BY, intervals.

WITH ordered AS (
    SELECT
        transaction_id,
        merchant_id,
        payment_method,
        amount,
        created_at,
        LAG(created_at) OVER (
            PARTITION BY merchant_id, payment_method, amount
            ORDER BY created_at
        ) AS prev_created_at
    FROM transactions
)
SELECT *
FROM ordered
WHERE prev_created_at IS NOT NULL
  AND created_at - prev_created_at <= INTERVAL '2 minutes';
