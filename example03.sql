/*
■レクチャー92
内部結合でテーブルを結合する「inner join」

▼課題
- 顧客一覧を取得
- 都道府県IDは都道府県名に変換
※ 必要な列 -> ユーザーID, 名字, 名前, 都道府県名
*/

SELECT users.id, users.last_name, users.first_name, prefectures.name
FROM users
INNER JOIN prefectures
ON users.prefecture_id = prefectures.id;

↓
【AS】を使って簡略化

SELECT u.id, u.last_name, u.first_name, p.name
FROM users AS u
INNER JOIN prefectures AS p
ON u.prefecture_id = p.id;

↓
【AS】と【INNER JOIN】の記述は省略可能
ただし【INNER JOIN】は【OUTER　JOIN】と区別を付けるため省略しないで書く事もある

SELECT u.id, u.last_name, u.first_name, p.name
FROM users u
JOIN prefectures p
ON u.prefecture_id = p.id;

--------------------------------------
/*
■レクチャー93
内部結合でテーブルを結合する「inner join」

▼課題
- 顧客一覧を取得
- 都道府県IDは都道府県名に変換
※ 必要な列 -> ユーザーID, 名字, 名前, 都道府県名
↓
▼追加条件
- 女性だけのデータに絞り込み
※ WHERE句を使って絞り込む

- 性別の判定は【users】テーブルの【gender】
gender -> 1・・・男性
gender -> 2・・・女性
*/

SELECT u.id, u.last_name, u.first_name, p.name
FROM users u
INNER JOIN prefectures p
ON u.prefecture_id = p.id
WHERE u.gender = 2;

--------------------------------------
/*
■レクチャー95
演習：内部結合

▼課題
・2017年1月の東京に住むユーザーの注文情報一覧を取得
・取得する列（カラム）
- 注文ID（orders.id）
- 注文日時（orders.order_time）
- 注文金額合計（orders.amount）
- ユーザーID（user.id）
- 名字（users.last_name）
- 名前（users.first_name）
*/

SELECT
    o.id order_id,
    o.order_time,
    o.amount,
    o.user_id,
    u.id user_id,
    u.last_name,
    u.first_name
FROM users AS u
INNER JOIN orders AS o
ON u.id = o.user_id
WHERE u.prefecture_id = 13
AND extract(year_month from order_time) = 201701
-- ▼下記の期間指定も有り
-- AND o.order_time >= '2017-01-01 00:00:00'
-- AND o.order_time < '2017-02-01 00:00:00'
ORDER BY order_id;

order_id, order_time, amount, user_id, user_id, last_name, first_name
'4','2017-01-01 13:10:00','38900','25','25','土屋','みき'
'12','2017-01-03 14:34:00','28300','888','888','武井','亮'
'16','2017-01-05 08:43:00','29400','105','105','羽田','美里'
'21','2017-01-08 03:56:00','35800','85','85','塩谷','翔'
'45','2017-01-17 10:14:00','19000','546','546','足立','朝香'
'61','2017-01-23 03:33:00','14800','770','770','三宅','賢二'
'63','2017-01-23 21:11:00','59700','401','401','水島','竜也'
'83','2017-01-31 02:54:00','15600','197','197','桜井','優'
'85','2017-01-31 05:27:00','59700','85','85','塩谷','翔'

--------------------------------------
/*
■レクチャー97
外部結合「OUTER JOIN」

▼外部結合とは
・片方のテーブルの情報がすべて出力されるテーブルの結合
・外部結合は欠落のあるデータを取り扱う結合
・内部結合「INNER JOIN」と違い片側のキーが存在しなくても「null」として出力される

▼LEFT OUTER JOIN / RIGHT OUTER JOIN
LEFT OUTER JOIN・・・左側（FROM句で最初に書いたテーブル）をマスタとする
RIGHT OUTER JOIN・・・右側（FROM句で後に書いたテーブル）をマスタとする
*/

-- LEFT OUTER JOIN は LEFT JOIN と省略できる
SELECT u.last_name, u.id user_id, o.user_id order_user_id, o.id order_id
FROM users AS u
LEFT JOIN orders AS o
ON u.id = o.user_id
ORDER BY u.id;
↓
-- LEFT JOINで実行すると「null」が入る
last_name, user_id, order_user_id, order_id
'柴咲','1','1','3'
'柴咲','1','1','40'
'柴咲','1','1','447'
'柴咲','1','1','651'
'柴咲','1','1','887'
'沢村','2','2','293'
'阿部','3',NULL,NULL
'佐古','4',NULL,NULL
'宮里','5','5','399'
'梅沢','6',NULL,NULL

--------------------------------------
/*
■レクチャー97
応用問題「OUTER JOIN」

▼課題
全ての商品についての販売個数を出力
*/

-- 商品情報はproductsテーブルに格納されている
-- order_detailsテーブルに紐づけて販売個数を出す
SELECT p.id, p.name, sum(od.product_qty)num
FROM products AS p
LEFT JOIN order_details AS od
ON p.id = od.order_id
GROUP BY p.id;

id, name, num
'1','商品0001','8'
'2','商品0002','15'
'3','商品0003','5'
'4','商品0004','8'
'5','商品0005','7'
'6','商品0006','9'
'7','商品0007','6'
'8','商品0008','19'
'9','商品0009','12'
'10','商品0010','6'
...

--------------------------------------
/*
■レクチャー98
３つ以上のテーブルを結合するケース

▼課題
・注文一覧を出力
┗注文詳細情報と商品情報も一覧の中に加える
*/

-- ポイント：【orders】をマスターテーブルとする

SELECT o.id order_id, o.user_id, o.amount, o.order_time time, p.name product_name, od.product_qty, p.price product_price
FROM orders AS o
INNER JOIN order_details AS od
ON o.id = od.order_id
INNER JOIN products AS p
on od.product_id = p.id;

↓

/*
▼追加課題
上記の【user_id】ではユーザーの特定ができない為
名字と名前を一覧に追加
*/

SELECT o.id order_id, o.user_id, u.last_name, u.first_name, o.amount, o.order_time time, p.name product_name, od.product_qty, p.price product_price
FROM orders AS o
INNER JOIN order_details AS od
ON o.id = od.order_id
INNER JOIN products AS p
on od.product_id = p.id
INNER JOIN users AS u
ON o.user_id = u.id;

↓

order_id, user_id, last_name, first_name, amount, time, product_name, product_qty, product_price
'1','504','河田','綾','37500','2017-01-01 03:43:00','商品0785','2','2700'
'1','504','河田','綾','37500','2017-01-01 03:43:00','商品0718','1','9200'
'1','504','河田','綾','37500','2017-01-01 03:43:00','商品0458','3','5500'
'1','504','河田','綾','37500','2017-01-01 03:43:00','商品0427','2','3200'
...

--------------------------------------