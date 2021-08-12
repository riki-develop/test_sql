/*1)productsテーブルから全件取得*/
select * from products;

/*2)idが1の行（カラム）を取得*/
select * from products where id = 1;

/*3)名前が「商品0003」の行を取得*/
select * from products where name = '商品0003';

/*4)priceが1000より大きい行（カラム）を取得*/
select * from products where price > 1000;

/*5)priceが1000より小さい行（カラム）を取得*/
select * from products where price < 1000;

/*6)priceが100でない行（カラム）を取得*/
select * from products where price <> 100;

/*7)--6:別の書き方*/
select * from products where price != 100;

/*8)idが1か2か3の行（カラム）を取得*/
select * from products where id in(1,2,3);

/*9)idが1か2か3ではない行（カラム）を取得*/
select * from products where id not in(1,2,3);

/*10)priceがnullではない行を取得*/
select * from products where price is not null;

/*11)priceがnullの行を取得*/
select * from products where price is null;

/*12)priceが1000から1900の行を取得*/
select * from products where price between 1000 and 1900;

/*13)12)をandで書く。
andは論理積。条件AとB両方成り立つ場合はtrue*/
select * from products where price >= 1000 and price <= 1900;

/*14)or(論理和)も使える
論理和。条件AまたはBどちらかが成り立つ場合はtrue*/
select * from products where price = 1000 or price = 2000;