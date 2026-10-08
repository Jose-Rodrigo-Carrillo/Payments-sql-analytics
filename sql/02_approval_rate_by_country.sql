-- Goal: approval rate by country and payment method
-- Skills: Aggregation, Filter, Reatios.

Select
    country,
    payment_method,
    Count(*) AS total_TX,
    Count(*) FILTER (WHERE status='approved') AS approved_tx,
    Round(100.0* Count(*) FILTER (WHERE status='approved')/Count(*),2)  AS approval_rate_pct
FROM transactions 
GROUP BY country, payment_method
ORDER BY approval_rate_pct DESC, total_tx DESC;
