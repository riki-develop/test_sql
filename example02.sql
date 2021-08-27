/*
■レクチャー79
算術演算子の種類

▼SQLで使える主な算術演算子
+「足し算」
-「引き算」
*「掛け算」
/「割り算」
%「余り」
*/

/*足し算*/
SELECT 10 + 3;

/*引き算*/
SELECT 10 - 3;

/*掛け算*/
SELECT 10 * 3;

/*割り算*/
SELECT 10 / 3;

/*余り*/
SELECT 10 % 3;

--------------------------------------
/*
■レクチャー80
nullを含んだ演算の注意点

nullを含んだ演算は「全て」nullになる
*/

/*足し算*/
SELECT 10 + null;
-> 結果：null

/*引き算*/
SELECT 10 - null;
-> 結果：null

/*掛け算*/
SELECT 10 * null;
-> 結果：null

/*割り算*/
SELECT 10 / null;
-> 結果：null

/*余り*/
SELECT 10 % null;
-> 結果：null

--------------------------------------
/*
■レクチャー81
絶対値の取得「ABS」

▼絶対値とは
数値の符号を考えない、ゼロからの距離の大きさを表す数値

・10の絶対値は10
・-10の絶対値は10
・0の絶対値は0
*/

/*10の絶対値*/
SELECT ABS(10);

/*-10の絶対値*/
SELECT ABS(-10);

/*0の絶対値*/
SELECT ABS(0);

--------------------------------------
/*
■レクチャー82
四捨五入「ROUND」

-- ROUND関数は第2引数で小数第○位を指定
-- 例）ROUND(10.555, 0) の場合は少数第1位 結果）11
-- 例）ROUND(10.555, 1) の場合は少数第2位 結果）10.6
-- 例）ROUND(10.555, 2) の場合は少数第3位 結果）10.56

▼課題
税込価格（8%）で商品一覧を出力
※少数第1位で出力
*/

-- ROUND()を使わずに税率計算した場合
SELECT id, name, price * 1.08
FROM products;
↓
/* ※結果
id, name, price * 1.08
'1','商品0001','5724.00'
'2','商品0002','6372.00'
'3','商品0003','1728.00'
*/

-- ROUND()を使って税率計算した場合
SELECT id, name, ROUND(price * 1.08, 0)
FROM products;
↓
/* ※結果
id, name, ROUND(price * 1.08, 0)
'1','商品0001','5724'
'2','商品0002','6372'
'3','商品0003','1728'
*/

--------------------------------------
/*
■レクチャー83
文字列の演算「文字列の連結」

・文字列連結
a||b・・・文字列aと文字列bを連結
↓
2012年移行では「concat」関数を使用
concat(文字列1, 文字列2, 文字列3・・・)

▼課題
ユーザー一覧を「山田 太郎さん」のように、
名字 + スペーズ + 名前 + さん
のフォーマットで出力
*/

SELECT concat(last_name, ' ', first_name, 'さん')
FROM users;

--------------------------------------
/*
■レクチャー84
文字列の演算「文字列の連結」

▼演習
メルマガ送信用のリスト作成

出力項目
- 宛名「名字 + さん」

- メールアドレス
※ 例）中村さん, nakamura@example.com

- 女性だけに送信
*/

SELECT concat(last_name, 'さん'), email, gender
FROM users
WHERE gender = 2;

--------------------------------------
/*
■レクチャー86〜87
日付と時刻の演算

▼主な日付と時刻の関数_演算子
・現在の日付・・・current_date
・現在の時刻・・・current_timestamp
・n日後の日付・・・d + n
・n日前の日付・・・d - n
・x時間後の時刻・・・interval'x hour'
・x時間前の時刻・・・ - interval'x hour'
・extract・・・日付や時刻の特定の部分（年や月）までを取り出す
*/

/*現在の日付*/
SELECT current_date();
結果 -> 2021-08-27

/*現在の時刻*/
SELECT current_timestamp();
結果 -> 2021-08-27 08:58:24

/*n日後の日付　例）3日後の日付を取得*/
SELECT current_date() + 3;
結果 -> 20210830

/*n日前の日付　例）3日前の日付を取得*/
SELECT current_date() - 3;
結果 -> 20210824

/*x時間後の時刻　例）6時間後の時刻*/
SELECT current_timestamp() + interval 6 hour;
結果 -> 2021-08-27 15:02:42

/*x時間前の時刻*/
SELECT current_timestamp() - interval 6 hour;
結果 -> 2021-08-27 03:04:09

-- extrantについて
-- 日付や時刻の特定の部分（年や月）までを取り出す

/*ordersテーブルから注文日時（order_timeカラム）が、2017年01月のレコードを取得*/
SELECT *
FROM orders
WHERE extract(year_month from order_time) = 201701;
結果 -> '1','504','37500','2017-01-01 03:43:00'・・・etc

/*ordersテーブルから注文日時（order_timeカラム）が、2017年のレコードを取得*/
SELECT *
FROM orders
WHERE extract(year from order_time) = 2017;
結果 -> '1','504','37500','2017-01-01 03:43:00'・・・etc

/*ordersテーブルから注文日時（order_timeカラム）が、01月のレコードを取得*/
SELECT *
FROM orders
WHERE extract(month from order_time) = 1;
結果 -> '1','504','37500','2017-01-01 03:43:00'・・・etc

--------------------------------------
