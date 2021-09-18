/*
■レクチャー119
応用問題：平均客単価

▼問題
・全期間における平均客単価
- 単価は小数点第一位で四捨五入
*/

-- 一回の購買によってユーザー一人当たりが支払う総額・・・orders.amountに格納されている
-- 平均値・・・AVG関数
-- 四捨五入・・・ROUND関数

SELECT ROUND(AVG(amount), 0) avg
FROM orders;
↓
avg
34784

--------------------------------------
/*
■レクチャー120
応用問題：月別平均客単価

▼問題
・月別の平均客単価
- 単価は小数点第一位で四捨五入

▼手順
・GROUP BY句で年月毎で集約して、年月別で平均客単価を求める
・amount.order_timeにはdatetime型で購入日が入っている
例）2017-01-01 00:00:00
・"201701"といった日付を指定された書式に設定するには
例）date_format(order_time, '%Y%m')
*/

SELECT
DATE_FORMAT(order_time, '%Y%m') order_year_month,
ROUND(AVG(amount), 0) average_customer_spend
FROM orders
GROUP BY DATE_FORMAT(order_time, '%Y%m')
ORDER BY order_year_month ASC;
↓
order_year_month, average_customer_spend
'201701','37877'
'201702','35374'
'201703','33624'
'201704','32266'
'201705','34552'
'201706','38809'
'201707','31003'
'201708','32951'
'201709','32077'
'201710','37446'
'201711','35080'
'201712','36714'

--------------------------------------
/*
■レクチャー121
応用問題：都道府県別の平均客単価

▼問題
・都道府県別の平均客単価

・必要な列
- 都道府県ID
- 都道府県名
- 平均客単価（小数点第1位で四捨五入）

・並び順
- 都道府県ID昇順
*/

-- GROUP BY句を使ってprefecture_idで集約し都道府県毎の平均客単価を出力
-- 注文情報はordersテーブル、都道府県はusersテーブルのprefecture_id、これを紐づける
-- 都道府県名はprefecturesテーブルが持っているので紐づける

SELECT
pref.id AS prefectuere_id,
pref.name AS prefectere_name,
ROUND(AVG(o.amount), 0) AS average_costomer_spend
FROM orders AS o
INNER JOIN users AS u
ON o.user_id = u.id
INNER JOIN prefectures AS pref
ON u.prefecture_id = pref.id
GROUP BY pref.id
ORDER BY pref.id ASC;
↓
prefectuere_id, prefectere_name, average_costomer_spend
'1','北海道','34300'
'2','青森県','34713'
'3','岩手県','34853'
'4','宮城県','26033'
'5','秋田県','38827'
'6','山形県','44892'
...

--------------------------------------
/*
■レクチャー121
応用問題：都道府県別・月別の平均客単価

・必要な列
- 都道府県ID
- 都道府県名
- 年月
- 平均客単価（小数点第1位で四捨五入）

・並び順
- 都道府県ID昇順、年月昇順
*/

-- GROUP BY句には複数の列を指定できる
-- 例）GROUP BY prefecture_id, order_year_month

-- datetime型の日時から年月だけ取り出す：date_format関数を使用
-- 例）date_fomat(order_time, '%Y%m')

SELECT
pref.id AS prefecture_id,
pref.name AS prefectre_name,
date_format(o.order_time, "%Y%m") AS order_year_month,
ROUND(AVG(o.amount), 0) AS average_customer_spend
FROM orders AS o
INNER JOIN users AS u
ON o.user_id = u.id
INNER JOIN prefectures AS pref
ON u.prefecture_id = pref.id
GROUP BY prefecture_id, order_year_month
ORDER BY prefecture_id, order_year_month;
↓
prefecture_id, prefectre_name, order_year_month, average_customer_spend
'1','北海道','201701','33940'
'1','北海道','201702','22040'
'1','北海道','201703','45200'
'1','北海道','201704','31300'
...