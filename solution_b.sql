SELECT u.user_id, u.user_name, o.order_id
FROM users u
JOIN orders o ON u.user_id = o.user_id;
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS so_don_hang
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name;
SELECT order_id, COUNT(product_id) AS so_san_pham
FROM order_details
GROUP BY order_id;
SELECT u.user_id, u.user_name, o.order_id, p.product_name
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
ORDER BY o.order_id ASC;
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS so_luong_don_hang
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name
ORDER BY so_luong_don_hang DESC
LIMIT 7;
SELECT DISTINCT u.user_id, u.user_name, o.order_id, p.product_name
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name LIKE '%Samsung%' OR p.product_name LIKE '%Apple%'
LIMIT 7;
SELECT u.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY o.order_id;
SELECT user_id, user_name, order_id, MAX(tong_tien) as tong_tien_lon_nhat
FROM (
    SELECT u.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY o.order_id
) AS temp
GROUP BY user_id;
SELECT user_id, user_name, order_id, MIN(tong_tien) as tong_tien_nho_nhat, so_san_pham
FROM (
    SELECT u.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien, COUNT(od.product_id) as so_san_pham
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY o.order_id
) AS temp
GROUP BY user_id;
SELECT user_id, user_name, order_id, tong_tien, MAX(so_san_pham) as so_sp_nhieu_nhat
FROM (
    SELECT u.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien, COUNT(od.product_id) as so_san_pham
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY o.order_id
) AS temp
GROUP BY user_id;
