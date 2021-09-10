/*
■レクチャー119
応用問題：平均客単価

▼問題
・全期間における平均客単価
- 単価は小数点第一位で四捨五入
*/

-- 一回の購買によってユーザー一人当たりが支払う総額・・・orders.amountに格納されている
-- 平均値・・・AVG関数
-- 四捨五入・・・ROUND関数

SELECT ROUND(AVG(amount), 0) avg
FROM orders;
↓
avg
34784

--------------------------------------
/*
■レクチャー120
応用問題：月別平均客単価

▼問題
・月別の平均客単価
- 単価は小数点第一位で四捨五入

▼手順
・GROUP BY句で年月毎で集約して、年月別で平均客単価を求める
・amount.order_timeにはdatetime型で購入日が入っている
例）2017-01-01 00:00:00
・"201701"といった日付を指定された書式に設定するには
例）date_format(order_time, '%Y%m')
*/

SELECT
DATE_FORMAT(order_time, '%Y%m') order_year_month,
ROUND(AVG(amount), 0) average_customer_spend
FROM orders
GROUP BY DATE_FORMAT(order_time, '%Y%m')
ORDER BY order_year_month ASC;
↓
order_year_month, average_customer_spend
'201701','37877'
'201702','35374'
'201703','33624'
'201704','32266'
'201705','34552'
'201706','38809'
'201707','31003'
'201708','32951'
'201709','32077'
'201710','37446'
'201711','35080'
'201712','36714'

--------------------------------------