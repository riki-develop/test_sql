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