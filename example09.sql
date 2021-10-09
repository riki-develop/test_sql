/*
■レクチャー134
新規DB作成

「book_store」というデータベースを作成
↓
【CREATE DATABASE】文を使う
構文：CREATE DATABASE book_store;
*/

-- 現在のDBを一覧表示
SHOW DATABASES;
↓
Database
'information_schema'
'mydb'
'mysql'
'performance_schema'
'sys'

-- 新規DB作成
CREATE DATABASE book_store;
↓
-- 変更後のDBを一覧表示
SHOW DATABASES;
↓
Database
'book_store'
'information_schema'
'mydb'
'mysql'
'performance_schema'
'sys'

--------------------------------------
/*
■レクチャー136
テーブルの追加

「books」というテーブルを作成
↓
▼例
- id・・・行のID
- title・・・本のタイトルを格納する
*/

-- 利用するDBを選択
USE book_store;

-- 現在のテーブル一覧
SHOW TABLES;

-- 空のDBにテーブルを作成
CREATE TABLE books(id int not null auto_increment primary key,title varchar(255)not null);
↓
/*
▼解説

・列名（id）
- int：整数型
- not unll：nullを許可しない
- auto_increment：idを自動的にふる
- primary key：主キーの設定

・列名（title）
- varchar(255)：最大255文字の可変長文文字列型
- not null：nullを許可しなし
*/
↓
-- 作成したテーブルと中身（カラム）を確認
SHOW COLUMNS FROM books;
↓
Field, Type, Null, Key, Default, Extra
'id','int','NO','PRI',NULL,'auto_increment'
'title','varchar(255)','NO','',NULL,''

--------------------------------------
/*
■レクチャー137
・テーブル構造の変更について
- 列の追加
- 列の変更
- 列の削除
*/

-- 例題①
-- 書籍を管理する'books'テーブルに、価格を管理する列を追加
-- 列名：'price', データ型：'int'を追加
↓
-- 利用するDBを選択
USE book_store;
-- 現在のテーブル一覧
SHOW TABLES;
-- 'books'テーブルのカラム一覧を表示
SHOW COLUMNS FROM books;
↓
-- カラム追加クエリ「ADD」
ALTER TABLE books ADD price INT AFTER id;
-- 'books'テーブルに'price'カラムが追加されているか確認
SHOW COLUMNS FROM books;
↓
Field	Type	Null	Key	Default	Extra
id	int	NO	PRI	NULL	auto_increment
price	int	YES		NULL
title	varchar(255)	NO		NULL

-- 例題②
-- 列名の変更
-- 列名'price'を'unit_price'に変更

-- 列名変更クエリ「CHANGE」
ALTER TABLE books CHANGE price unit_price int;
-- 指定した列名が変更されているか確認
SHOW COLUMNS FROM books;
↓
Field, Type, Null, Key, Default, Extra
'id','int','NO','PRI',NULL,'auto_increment'
'unit_price','int','YES','',NULL,''
'title','varchar(255)','NO','',NULL,''

-- 例題③
-- 列の削除
-- 'books'テーブルから列'unit_price'を削除

-- 列削除クエリ「DROP」
ALTER TABLE books DROP unit_price;
-- 指定した列が削除されているか確認
SHOW COLUMNS FROM books;
↓
Field, Type, Null, Key, Default, Extra
'id','int','NO','PRI',NULL,'auto_increment'
'title','varchar(255)','NO','',NULL,''

--------------------------------------
/*
■レクチャー138
・booksテーブルの削除
*/

-- 現状確認
SHOW tables;
-- boobksテーブル削除クエリ
DROP TABLE books;
-- 実行結果確認
SHOW tables;
↓
何もないので表示されない

--------------------------------------
