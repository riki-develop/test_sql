/*
■レクチャー61
合計値「sum」

▼例題
2017年1月の合計売上を出力
*/

-- sum集約関数を使った合計値の出し方例
SELECT sum(amount)
FROM orders
WHERE order_time >= '2017-01-01 00:00:00'
AND order_time < '2017-02-01 00:00:00';

↓
sum(amount)
3295300

--------------------------------------
/*
■レクチャー62
平均値「avg」

▼例題
全商品価格の平均値
*/

-- avg集約関数を使った平均値の出し方例
SELECT avg(price)
FROM products;

↓
avg(price)
4937.7000

--------------------------------------
/*
■レクチャー63
最小値「min」

▼例題
全商品の最小値
*/

-- min集約関数を使った最小値の出し方例
SELECT min(price)
FROM products;

↓
min(price)
100

--------------------------------------
/*
■レクチャー64
最小値「max」

▼例題
全商品の最大値
*/

-- max集約関数を使った最大値の出し方例
SELECT max(price)
FROM products;

↓
max(price)
10000

--------------------------------------
/*
■レクチャー66
行数を数える「count」

▼例題
ユーザーが何人いるか
*/

SELECT count(*)
FROM users;

↓
count(*)
1000

/*
▼例題2
女性ユーザーが何人いるか
*/

SELECT count(*) 
FROM users
WHERE gender = 2;

↓
count(*)
474

--------------------------------------