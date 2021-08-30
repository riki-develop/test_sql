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