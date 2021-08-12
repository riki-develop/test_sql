/*
商品一覧を10件だけ抽出
↓
LIMIT句を使う
↓
SELECT カラム名, カラム名 FROM テーブル名 【オフセット】 LIMIT 件数;
*/

-- 0〜10件
SELECT * FROM products LIMIT 10;

id, name, price
'1','商品0001','5300'
'2','商品0002','5900'
'3','商品0003','1600'
'4','商品0004','3800'
'5','商品0005','9500'
'6','商品0006','7000'
'7','商品0007','6100'
'8','商品0008','2200'
'9','商品0009','7600'
'10','商品0010','4200'

---------------------

-- 10〜10件
SELECT * FROM products LIMIT 10, 10;

id, name, price
'11','商品0011','700'
'12','商品0012','3400'
'13','商品0013','6600'
'14','商品0014','1600'
'15','商品0015','2200'
'16','商品0016','8200'
'17','商品0017','8400'
'18','商品0018','4800'
'19','商品0019','6000'
'20','商品0020','8100'