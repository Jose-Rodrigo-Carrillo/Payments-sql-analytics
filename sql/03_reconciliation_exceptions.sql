-- Goal: reconcile approved transactions against settlements and list exceptions.
-- Skills: FULL OUTER JOIN, CTE, CASE WHEN.


WITH joined AS (
  SELECT
    t.transaction_id,
    s.settlement_id,
    s.transaction_id AS settlement_tx_ref,
    t.amount AS tx_amount,
    s.settlement_amount 
  FROM transactions t 
  FULL OUTER JOIN settlements s
      ON s.transaction_id=t.transaction_id
  where t.status ='approved'
      OR t.transaction_id IS NULL
  ),
classified AS (
  SELECT
    *,
    CASE
      WHEN settlement_id IS NULL THEN 'missing_settlement'
      WHEN transaction_id IS NULL THEN 'orphan_settlement'
      WHEN tx_amount <> settled_amount THEN 'amount_mismatch'
      ELSE AS recon_status
  FROM joined
)

SELECT *
FROM classified
WHERE recon_status <> 'matched'
ORDER BY recon_status, transaction_id;
