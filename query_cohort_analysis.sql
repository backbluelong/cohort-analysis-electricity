-- Cohort Analysis: Tính tỉ lệ khách hàng quay lại sau tháng đầu tiên
-- Áp dụng cho sub_category = 'electricity' và message_id = 1
WITH table_first_month AS (
    SELECT customer_id, order_id, transaction_date,
           MIN(MONTH(transaction_date)) OVER (PARTITION by customer_id) AS FIRST_month
    FROM payment_history_18 AS his
    JOIN product AS pro 
        ON his.product_id = pro.product_number
    WHERE message_id = 1 AND sub_category = 'electricity'
),
table_month AS (
    SELECT *,
           MONTH(transaction_date) - FIRST_month AS month_n
    FROM table_first_month
),
table_retained AS (
    SELECT FIRST_month, month_n,
           COUNT(DISTINCT customer_id) AS retained_customer
    FROM table_month
    GROUP BY FIRST_month, month_n
),
table_retention AS (
    SELECT *,
           MAX(retained_customer) OVER (PARTITION BY FIRST_month) AS original_customers,
           CAST(retained_customer AS DECIMAL(10, 4)) / 
           MAX(retained_customer) OVER (PARTITION BY FIRST_month) AS PERCENTAGE
    FROM table_retained
)
-- PIVOT
SELECT FIRST_month, original_customers, [0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11]
FROM (
    SELECT FIRST_month, month_n, original_customers,
           CAST(PERCENTAGE AS DECIMAL(10,4)) AS pct
    FROM table_retention
) AS source_table
PIVOT (
    SUM(pct)
    FOR month_n IN ([0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11])
) AS pivot_logic
ORDER BY FIRST_month;