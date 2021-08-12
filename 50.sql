/*
1.漢字の「中」から始まる名字のユーザーを抽出
2.漢字の「中」を含む名字のユーザーを抽出
3.漢字の「子」で終わる名前のユーザーを抽出
4.漢字の「子」で終わる＆3文字の名前のユーザーを抽出
↓
LIKE句を使う
↓
SELECT カラム名, カラム名 FROM テーブル名 WHERE カラム名 LIKE ワイルドカード文字;

▼LIKE句で使うワイルドカード文字
・「%」パーセント：0文字以上、任意の文字列
・「_」アンダースコア：任意の一文字
*/

-- 中から始まる
SELECT * FROM users WHERE last_name LIKE '中%';

-- 中を含む
SELECT * FROM users WHERE last_name LIKE '%中%';

-- 子で終わる
SELECT * FROM users WHERE first_name LIKE '%子';

-- 名前3文字＆子で終わる
SELECT * FROM users WHERE first_name LIKE '__子';