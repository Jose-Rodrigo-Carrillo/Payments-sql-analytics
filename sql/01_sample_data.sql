
-- Synthetic data. Includes deliberate edge cases:
--   tx 4: settled amount differs from transaction amount
--   tx 8: duplicate of tx 7 (same merchant, method, amount, 30s apart)
--   tx 8 and 9: approved but never settled
--   settlement 7: refers to a transaction that does not exist

INSERT INTO transactions VALUES
(1, 101, 'ES', 'card',   50.00,  'EUR', 'approved', '2026-01-05 10:00:00'),
(2, 101, 'ES', 'card',   120.00, 'EUR', 'declined', '2026-01-05 11:30:00'),
(3, 102, 'NL', 'ideal',  80.00,  'EUR', 'approved', '2026-01-06 09:15:00'),
(4, 102, 'NL', 'ideal',  35.50,  'EUR', 'approved', '2026-01-06 14:20:00'),
(5, 102, 'NL', 'card',   200.00, 'EUR', 'declined', '2026-01-07 16:45:00'),
(6, 103, 'DE', 'card',   75.00,  'EUR', 'approved', '2026-01-07 08:10:00'),
(7, 103, 'DE', 'paypal', 60.00,  'EUR', 'approved', '2026-01-08 12:00:00'),
(8, 103, 'DE', 'paypal', 60.00,  'EUR', 'approved', '2026-01-08 12:00:30'),
(9, 101, 'ES', 'card',   90.00,  'EUR', 'approved', '2026-01-09 18:30:00'),
(10, 101, 'ES', 'card',  45.00,  'EUR', 'declined', '2026-01-09 19:00:00');

INSERT INTO settlements VALUES
(1, 1,   50.00, '2026-01-07 06:00:00'),
(2, 3,   80.00, '2026-01-08 06:00:00'),
(3, 4,   35.00, '2026-01-08 06:00:00'),
(4, 6,   75.00, '2026-01-09 06:00:00'),
(5, 7,   60.00, '2026-01-10 06:00:00'),
(7, 999, 25.00, '2026-01-10 06:00:00');
