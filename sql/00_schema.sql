
-- Schema for a simplified payments dataset (Synthetic data)

Create table transactions (
  transaction_id INT PRIMARY KEY,
  merchant_id INT NOT NULL,
  country CHAR(2) NOT NULL,
  payment_method VARCHAR(20) NOT NULL,
  amount NUMERIC(10,2) NOT NULL,
  currency CHAR(3) NOT NULL DEFAULT 'EUR',
  status VARCHAR(10) NOT NULL CHECK (status IN ('approved', 'declined')),
  created_at TIMESTAMP NOT NULL);


CREATE TABLE settlements(
  settlement_id INT PRIMARY KEY,
  transaction_id INT,
  settled_amount NUMERIC (10,2) NOT NULL,
  settled_at TIMESTAMP NOT NULL
);
