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
/*
■レクチャー67
行数を数える「count」応用

▼例題
2017年1月にアクセスしたユニークユーザー数
*/


-- 【count(distinct hoge)】は重複をまとめる
SELECT count(distinct user_id)
FROM access_logs
WHERE request_month = '2017-01-01';

↓
count(distinct user_id)
621
--------------------------------------
/*
■レクチャー68
データをグループ化「group by」

▼例題
都道府県別のユーザー数
*/

SELECT prefecture_id, COUNT(*)
FROM users
GROUP BY prefecture_id;

↓
prefecture_id, COUNT(*)
'1','39'
'2','17'
'3','17'
'4','13'
'5','13'
'6','10'
'7','13'
'8','18'
'9','17'
'10','10'
'11','70'
'12','42'
'13','101'
'14','81'
'15','21'
'16','10'
'17','6'
'18','8'
'19','8'
'20','23'
'21','14'
'22','28'
'23','53'
'24','14'
'25','12'
'26','27'
'27','62'
'28','37'
'29','12'
'30','9'
'31','2'
'32','9'
'33','17'
'34','15'
'35','17'
'36','7'
'37','8'
'38','9'
'39','6'
'40','29'
'41','10'
'42','11'
'43','15'
'44','10'
'45','10'
'46','14'
'47','6'

--------------------------------------
/*
■レクチャー69
データをグループ化「group by」
期間ごとに集計

▼例題
2017年の月別ユニークユーザー数
*/

-- request_monthでほしい期間をしぼる
-- count(distinct ....)で重複をまとめる
SELECT request_month, count(distinct user_id)
FROM access_logs
WHERE request_month >= '2017-01-01'
AND request_month < '2018-01-01'
GROUP BY request_month;

↓
request_month, count(distinct user_id)
'2017-01-01','621'
'2017-02-01','597'
'2017-03-01','641'
'2017-04-01','632'
'2017-05-01','649'
'2017-06-01','615'
'2017-07-01','639'
'2017-08-01','638'
'2017-09-01','646'
'2017-10-01','626'
'2017-11-01','609'
'2017-12-01','624'

--------------------------------------
/*
■レクチャー70
集約結果を更に絞り込む「having」

▼例題
2017年のアクセスログから
月間ユニークユーザー数が630人以上の月を一覧に
*/

/*
※記述順序
HAVING句は必ずGROUP BYの後に書く

SELECT
↓
FROM
↓
WHERE
↓
GROUP BY
↓
HAVING
*/

-- HAVINGで630以上の条件をつける
SELECT request_month, count(distinct user_id)
FROM access_logs
WHERE request_month >= '2017-01-01'
AND request_month < '2018-01-01'
GROUP BY request_month
HAVING count(distinct user_id) >= 630;

request_month, count(distinct user_id)
'2017-03-01','641'
'2017-04-01','632'
'2017-05-01','649'
'2017-07-01','639'
'2017-08-01','638'
'2017-09-01','646'

--------------------------------------
/*
■レクチャー72
データの集約「GROUP BY」応用
*/

/*
▼例題①
全てのアクセスログを出力
*/

SELECT *
FROM access_logs;

/*
▼例題②
①で出したデータを2017年1月〜2017年6月までに絞り込み
*/

SELECT *
FROM access_logs
WHERE request_month >= '2017-01-01'
AND request_month < '2017-07-01';

/*
▼例題③
月ごとのリクエスト数を出力
*/

SELECT request_month, count(*)
FROM access_logs
GROUP BY request_month;

/*
▼例題④
アクセス数が1000以上の月のみ出力
*/

SELECT request_month, count(*)
FROM access_logs
GROUP BY request_month
HAVING count(*) >= 1000;

--------------------------------------
/*
■レクチャー74
データの並び替え「ORDER BY」
*/

-- ポイント：降順（大→小）で並び替える
-- asc・・・照準　※デフォルト
-- desc・・・降順
-- ORDER BYを指定しない場合、どんな並び順になるかわからない

/*
▼例題①
商品一覧を価格が高い順に並び替え
*/

SELECT *
FROM products
ORDER BY price DESC;

/*
▼例題②
商品一覧を価格が低い順に並び替え
*/

SELECT *
FROM products
ORDER BY price ASC;

--------------------------------------