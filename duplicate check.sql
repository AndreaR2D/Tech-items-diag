SELECT *
FROM (
SELECT event_date,
	Row_ID,
		CASE 
			WHEN Row_ID -  LAG(Row_ID, 1) OVER w = 1
			THEN 'Dup' 
			ELSE 'Legit'
		END AS Row_Chk,
	problem,
		CASE 
			WHEN problem = LAG(problem, 1) OVER w
			THEN 'Dup'
			ELSE 'Legit'
		END AS Prob_chk,
	Partner_Category,
		CASE 
			WHEN Partner_Category = LAG(Partner_Category, 1) OVER w
			THEN 'Dup'
			ELSE 'Legit' 
		END AS Parter_Cate_chk,
	product_category,
		CASE 
			WHEN product_category = LAG(product_category, 1) OVER w
			THEN 'Dup'
			ELSE 'Legit' 
		END AS Prod_Cate_chk,
	brand,
		CASE 
			WHEN brand = LAG(brand, 1) OVER w
			THEN 'Dup'
			ELSE 'Legit' 
		END AS brand_chk,
	repair_status,
		CASE 
			WHEN repair_status = LAG(repair_status, 1) OVER w
			THEN 'Dup'
			ELSE 'Legit' 
		END AS repair_chk, 
	group_identifier,
		CASE 
			WHEN group_identifier = LAG(group_identifier, 1) OVER w
			THEN 'Dup'
			ELSE 'Legit' 
		END AS group_chk
FROM "1"
WINDOW w AS (ORDER BY event_date)
ORDER BY 1);