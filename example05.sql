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
/*
■レクチャー111
応用問題：サブクエリ

▼課題
・全商品の平均単価よりも、単価が高い商品の一覧

▼ポイント「スカラ・サブクエリ」
・必ず1行1列だけの戻り値を返すサブクエリ
・スカラとは「単一の」という意味
・絶対にサブクエリが複数行を返さないようにする
*/

-- AVG()関数を使ってpriceの平均を出力
SELECT AVG(price)
FROM products;
↓
-- 上記の結果をサブクエリで条件分岐に使う
AVG(price)
4937.7000
↓
SELECT *
FROM products
WHERE price > (
SELECT AVG(price)
FROM products
);
↓
id, name, price
'1','商品0001','5300'
'2','商品0002','5900'
'5','商品0005','9500'
'6','商品0006','7000'
...

/*
▼課題2
・上記の結果を、商品単価の高い順に並び替える
・商品単価が同じ時は、登録順（id昇順）に並び替える
*/

-- ORDER BY句で並び替え「DESCは降順 / ASCは昇順」
SELECT *
FROM products
WHERE price > (
SELECT AVG(price)
FROM products
)
ORDER BY price DESC, id ASC;
↓
id, name, price
'83','商品0083','10000'
'221','商品0221','10000'
'448','商品0448','10000'
'548','商品0548','10000'
...