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
