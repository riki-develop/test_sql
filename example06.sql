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
/*
■レクチャー114
取得値nullを0に置き換える
*/

-- ▼例：下記クエリの実行結果にnullが混じっている
SELECT p.id, p.name, SUM(pd.product_qty) AS num
FROM products AS p
LEFT OUTER JOIN order_details AS pd
ON p.id = pd.product_id
GROUP BY p.id;
↓
id, name, num
'1','商品0001','6'
'2','商品0002','10'
'3','商品0003','5'
'4','商品0004',NULL
↓
-- 上記のnullをCASE式を使って0に置き換える
SELECT p.id, p.name,
CASE
WHEN SUM(od.product_qty) IS null then 0
ELSE SUM(od.product_qty)
END AS num
FROM products AS p
LEFT OUTER JOIN order_details AS od
ON p.id = od.product_id
GROUP BY p.id;
↓
id, name, num
'1','商品0001','6'
'2','商品0002','10'
'3','商品0003','5'
'4','商品0004','0'

--------------------------------------
/*
■レクチャー115〜117
演習：商品販売個数でランク分け

▼課題
・全商品を販売個数でランク分け
- A：20個以上
- B：10個以上
- C：10個未満

・ランクが高い順に並び替え

・必要なカラム
- 商品ID
- 商品名
- 販売個数
- ランク（A, B, C）
*/

/*
1. 商品一覧を出力
2. 商品一覧に注文詳細（order_details）を結合(ELFT OUTER JOIN)
3. 商品ごとの販売数を求める（GROUP BY と　SUM()集約関数でproduct_qtyを集計）
4. CASEを使って販売個数をランク付け
5. ランクが高い順に並び替える（ORDER BY）
*/

SELECT p.id product_id, p.name product_name, SUM(product_qty) sales_num,
CASE
WHEN SUM(product_qty) >= 20 then 'A'
WHEN SUM(product_qty) >= 10 then 'B'
ELSE 'C'
END sales_rank
FROM products AS p
LEFT OUTER JOIN order_details AS od
ON p.id = od.product_id
GROUP BY p.id
ORDER BY sales_rank ASC;
↓
product_id, product_name, sales_num, sales_rank
'23','商品0023','21','A'
'65','商品0065','20','A'
'149','商品0149','23','A'
'468','商品0468','24','A'
'480','商品0480','21','A'
'487','商品0487','20','A'
'567','商品0567','23','A'
'992','商品0992','21','A'
'2','商品0002','10','B'
'10','商品0010','13','B'
...

--------------------------------------