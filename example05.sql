/*
■レクチャー108
サブクエリ「WHERE句」

▼課題
・2017年12月に、商品を購入して"いない"ユーザーにメルマガを打ちたい
・該当ユーザー一覧を出力
・必要な情報はユーザーID、名字、email
*/

-- ポイント：サブクエリと【not in】演算子を利用する
-- ポイント：サブクエリとはある問い合わせの結果に基づいて、異なる問い合わせを行う仕組み

-- usersテーブル存在確認
SELECT id, last_name, email
FROM users;

-- ordersテーブル存在確認
SELECT user_id
FROM orders
WHERE order_time >= '2017-12-01 00:00:00'
AND order_time < '2018-12-01 00:00:00';
↓
-- 上記を合わせてサブクエリを実行
SELECT id, last_name, email
FROM users
WHERE id NOT IN(
SELECT user_id
FROM orders
WHERE order_time >= '2017-12-01 00:00:00'
AND order_time < '2018-12-01 00:00:00');

--------------------------------------
/*
■レクチャー109〜110
演習：サブクエリ「WHERE句」

▼課題
・2017年12月に、商品を購入して"した"ユーザーにメルマガを打ちたい
・該当ユーザー一覧を出力
・必要な情報はユーザーID、名字、email

▼復習：in 演算子
・ある値が値セット内に含まれて"いる"かどうか
・idが1か2か3の行を取得
SELECT *
FROM products
WHERE id in(1, 2, 3);
*/

SELECT id, last_name, email
FROM users
WHERE id IN(
SELECT user_id
FROM orders
WHERE order_time >= '2017-12-01 00:00:00'
AND order_time < '2018-01-01 00:00:00');

--------------------------------------