/*
2017年1月の合計売上
*/

-- sum集約関数を使った合計値の出し方例
SELECT sum(amount)
FROM orders
WHERE order_time >= '2017-01-01 00:00:00'
AND order_time < '2017-02-01 00:00:00';

↓
sum(amount)
3295300