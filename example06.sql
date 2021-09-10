--------------------------------------
/*
■レクチャー113
条件によって値を変更する

▼課題
・ユーザーを累計注文数でランク分け
- A：5回以上
- B：2回以上
- c：１回
※注文回数0回のユーザーは出力しない

・必要情報
- ユーザーID
- 累計注文回数
- ユーザーランク（A or B or C）
*/

-- CASEから始まりWHENで条件指定、ELSEで対象外指定、ENDで閉める
SELECT u.id user_id, COUNT(*) num,
CASE
WHEN COUNT(*) >= 5 then 'A'
WHEN COUNT(*) >= 2 then 'B'
ELSE 'C'
END AS user_rank
FROM users AS u
INNER JOIN orders AS o
ON u.id = o.user_id
GROUP BY u.id;
↓
user_id, num, user_rank
'1','5','A'
'2','1','C'
'5','1','C'
'7','1','C'
...

/*
▼課題2
上記の結果をランクが高い順に並び替え（A→B→C）
*/

-- ORDER BY句でuser_rankを昇順に並び替え
SELECT u.id user_id, COUNT(*) num,
CASE
WHEN COUNT(*) >= 5 then 'A'
WHEN COUNT(*) >= 2 then 'B'
ELSE 'C'
END AS user_rank
FROM users AS u
INNER JOIN orders AS o
ON u.id = o.user_id
GROUP BY u.id
ORDER BY user_rank ASC;
↓
user_id, num, user_rank
'1','5','A'
'15','5','A'
'201','5','A'
'426','5','A'
...

--------------------------------------