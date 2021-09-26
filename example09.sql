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
