
-- Goal: days between transaction and settlement, with the country average.
-- Skills: JOIN, window AVG() OVER, date arithmetic.

SELECT
    t.country,
    t.transaction_id,
    (s.settled_at::date - t.created_at::date)                      AS days_to_settle,
    ROUND(AVG(s.settled_at::date - t.created_at::date)
          OVER (PARTITION BY t.country), 2)                        AS avg_days_country
FROM transactions t
JOIN settlements s USING (transaction_id)
ORDER BY t.country, t.created_at;
