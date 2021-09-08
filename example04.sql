/*
■レクチャー104
▼ビューの作り方
・CREATE VIEW文を使う
↓
CREATE VIEW ビュー名（<ビューの列名1>, <ビューの列名2>...）
AS
<SELECT文>
*/

/*
▼課題
都道府県別のユーザー数
*/

-- SELECT文のみ
SELECT p.name, COUNT(*) AS count
FROM users AS u
INNER JOIN prefectures AS p
ON u.prefecture_id = p.id
GROUP BY u.prefecture_id;
↓
-- SELECT文からVIEWを作成
CREATE VIEW prefecture_user_counts(name, count)
AS
SELECT p.name, COUNT(*) AS count
FROM users AS u
INNER JOIN prefectures AS p
ON u.prefecture_id = p.id
GROUP BY u.prefecture_id;
↓
-- 上記で生成したVIEWを呼び出す
SELECT name, count
FROM prefecture_user_counts;

--------------------------------------
/*
■レクチャー106
ビューの削除「DROP VIEW」
*/

-- 削除構文
DROP VIEW prefecture_user_counts;

-- VIEW存在確認
SELECT name, count
FROM prefecture_user_counts;

--------------------------------------