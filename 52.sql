/*
・男性ユーザーの一覧を取得
・取得する件数は10件
・取得するカラムは「id, last_name, gender」
*/

SELECT id, last_name, gender FROM users WHERE gender = 1 LIMIT 10;

id, last_name, gender
'2','沢村','1'
'4','佐古','1'
'5','宮里','1'
'8','高岡','1'
'9','大下','1'
'10','西岡','1'
'11','飯塚','1'
'12','川瀬','1'
'15','下川','1'
'16','坂口','1'
