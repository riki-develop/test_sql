/*
■レクチャー124
新商品を一件追加

・商品名：新商品A
・価格：1,000円
*/

-- productsテーブルに一商品追加
INSERT INTO products(name, price)values('新商品A', 1000);

-- 上記クエリの実行結果確認
SELECT * FROM products;
↓
id, name, price
'997','商品0997','5600'
'998','商品0998','4100'
'999','商品0999','3600'
'1000','商品1000','7000'
'1001','新商品A','1000'
...

--------------------------------------
/*
■レクチャー125
列を省略して1レコード追加する

▼INSERTの基本的な文法
例）INSERT INTO products(name, price) values('新商品A', 1000);
↓
▼列の指定を省略してINSERTを行う方法がある
例）INSERT products values(1004, '新商品B', 2000)

※上記の様に列の指定を省略した時の注意点
テーブルの全列に対して値を指定する必要がある
*/

-- productsテーブルに一商品追加
INSERT INTO products values(1004, '新商品B', 2000);

-- 上記クエリの実行結果確認
SELECT * FROM products;
↓
id, name, price
'999','商品0999','3600'
'1000','商品1000','7000'
'1001','新商品A','1000'
'1002','新商品A','1000'
'1003','新商品A','1000'
'1004','新商品B','2000'
...

--------------------------------------
/*
■レクチャー126
行（レコード）を複数追加する

▼新商品3件をDBに追加
・商品名：新商品C
・価格：3000

・商品名：新商品D
・価格：4000

・商品名：新商品E
・価格：5000
*/

-- 複数レコードを一回のクエリで実行する例
-- idはSQLが自動でオートインクリメントするので省略
INSERT INTO products(name, price)
VALUES
('新商品C', 3000),
('新商品D', 4000),
('新商品E', 5000);
↓
id, name, price
'999','商品0999','3600'
'1000','商品1000','7000'
'1001','新商品A','1000'
'1002','新商品A','1000'
'1003','新商品A','1000'
'1004','新商品B','2000'
'1005','新商品C','3000'
'1006','新商品D','4000'
'1007','新商品E','5000'
...

--------------------------------------
/*
■レクチャー127
データの更新「UPDATE」

・全商品10％引きに
*/

SELECT * FROM products;

-- 一度にUPDATEするのは危険なので下記クエリで制限を解除する
SET sql_safe_updates = 0;

UPDATE products SET price = price * 0.9;
↓
id, name, price
'1000','商品1000','6300'
'1001','新商品A','900'
'1002','新商品A','900'
'1003','新商品A','900'
'1004','新商品B','1800'
'1005','新商品C','2700'
'1006','新商品D','3600'
'1007','新商品E','4500'
...

--------------------------------------
/*
■レクチャー128
特定の条件に合致するデータを更新「UPDATE」

・商品idが「3」の商品名を「SQL入門」に変更
*/

-- 存在確認
SELECT *
FROM products
WHERE id = 3;
↓
id, name, price
'3','商品0003','1296'

-- データを更新
UPDATE products
SET name = 'SQL入門'
WHERE id = 3;
↓
id, name, price
'3','SQL入門','1296'

-- 複数のデータをまとめて更新するパターン
UPDATE products
SET name = 'SQL入門1', price = 1000
WHERE id = 3;
↓
id, name, price
'3','SQL入門1','1000'

--------------------------------------
/*
■レクチャー129
特定の条件に合致するデータを更新「UPDATE」

・累計販売数が10を超えている商品の価格を5%アップ
*/

-- 商品IDごとの合計販売数を出力
SELECT product_id, SUM(product_qty)
FROM order_details
GROUP BY product_id;
↓
product_id, SUM(product_qty)
'1','6'
'2','10'
'3','5'
...

-- 累計販売個数が10以上のグループ絞り込み
SELECT product_id, SUM(product_qty)
FROM order_details
GROUP BY product_id
HAVING SUM(product_qty) >= 10;
↓
product_id, SUM(product_qty)
'2','10'
'10','13'
'11','11'
...

-- 上記で絞り込んだ対象商品をサブクエリとしてせっと->5%をかける
UPDATE products
SET price =price * 1.05
WHERE id IN
(
SELECT product_id
FROM order_details
GROUP BY product_id
HAVING SUM(product_qty) >= 10
);

select *
FROM products;
↓
id, name, price
'1','商品0001','4293'
'2','商品0002','7748'
'3','SQL入門1','1000'
...
