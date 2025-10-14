/*
				===========================================

					EDA (Exploanatory Data Analysist)

				===========================================
		
*/

-- !! Tambahkan profit margin, karena sales_amount=>laba kotor dan profit_margin=>laba bersih

SELECT * FROM sales.customers;
SELECT * FROM sales.date;
SELECT * FROM sales.markets ORDER BY markets_name;
SELECT * FROM sales.products;
SELECT * FROM sales.transactions;

/*
Dimensi Customer:
-- 
1. Perbandingan kontribusi antar tipe pelanggan
2. Pelanggan terbaik bedasarkan penjualan
3. Tipe pelanggan terbaik berdasarkan penjualan 
4. Pelanggan terbaik pada 'Brick & Mortar'
5. Pelanggan terbaik pada 'E-Commerce'
6. Perbandingan pelanggan berdasarkan tipe pelanggan
*/


SELECT COUNT(*)
FROM sales.customers
-- WHERE customer_type = 'Brick & Mortar'
WHERE customer_type = 'E-Commerce';


-- Perbandingan kontribusi antar tipe pelanggan

SELECT customer_type,
		SUM(t.sales_amount) AS total_revenue,
        ROUND(SUM(t.profit_margin),2) AS total_margin,
		CONCAT(ROUND((SUM(t.sales_amount) / 984813463) * 100, 2), "%") AS magnitude_to_total_revenue,
        CONCAT(ROUND((SUM(t.profit_margin) / 24657068.40) * 100, 2), "%") AS magnitude_to_total_profit
FROM sales.transactions t
JOIN sales.customers c
ON t.customer_code = c.customer_code
WHERE customer_type = 'Brick & Mortar'
UNION
SELECT customer_type,
		SUM(t.sales_amount) AS total_revenue,
        ROUND(SUM(t.profit_margin),2) AS total_margin,
		CONCAT(ROUND((SUM(t.sales_amount) / 984813463) * 100, 2), "%") AS agnitude_to_total_revenue,
        CONCAT(ROUND((SUM(t.profit_margin) / 24657068.40) * 100, 2), "%") AS magnitude_to_total_profit
FROM sales.transactions t
JOIN sales.customers c
ON t.customer_code = c.customer_code
WHERE customer_type = 'E-Commerce'
;


-- Pelanggan terbaik bedasarkan penjualan
WITH customer_ranking AS(
SELECT c.custmer_name,
		SUM(t.sales_amount) AS total_revenue,
        ROUND(SUM(t.profit_margin),2) AS total_margin,
        ROW_NUMBER() OVER(ORDER BY SUM(t.profit_margin) DESC) AS rank_customer
FROM sales.transactions t
JOIN sales.customers c
ON t.customer_code = c.customer_code
GROUP BY 1
ORDER BY 3 DESC
)
SELECT custmer_name,
		total_revenue,
        total_margin,
        CONCAT(ROUND((total_revenue / 984813463) * 100,2),"%") AS persentase_revenue,
        CONCAT(ROUND((total_margin / 24657068.40) * 100,2),"%") AS persentase_profit        
FROM customer_ranking
GROUP BY 1,2,3
;


-- Tipe pelanggan terbaik berdasarkan penjualan
WITH total_income AS(
	SELECT c.customer_type,
			SUM(t.sales_amount) AS total_revenue,
			ROUND(SUM(t.profit_margin),2) AS total_margin
	FROM sales.transactions t
	JOIN sales.customers c
	ON t.customer_code = c.customer_code
	GROUP BY 1
	ORDER BY 2 DESC
)
SELECT customer_type,
		total_revenue,
        total_margin,
        CONCAT(ROUND((total_revenue / 984813463) * 100,2),"%") AS persentase_revenue,
        CONCAT(ROUND((total_margin / 24657068.40) * 100,2),"%") AS persentase_profit        
FROM total_income
GROUP BY 1,2,3
;

-- Pelanggan terbaik pada 'Brick & Mortar'

SELECT c.custmer_name,
		c.customer_type,
		SUM(t.sales_amount) AS total_revenue,
        ROUND(SUM(t.profit_margin),2) AS total_margin,
        CONCAT(ROUND((SUM(t.sales_amount) / 984813463) * 100,2),"%") AS persentase_revenue,
        CONCAT(ROUND((SUM(t.profit_margin) / 24657068.40) * 100,2),"%") AS persentase_profit
FROM sales.transactions t
JOIN sales.customers c
ON t.customer_code = c.customer_code
WHERE c.customer_type='Brick & Mortar'
GROUP BY 1,2
ORDER BY 4 DESC;


-- Pelanggan terbaik pada 'E-Commerce'

SELECT c.custmer_name,
		c.customer_type,
		SUM(t.sales_amount) AS total_revenue,
        ROUND(SUM(t.profit_margin),2) AS total_margin,
        CONCAT(ROUND((SUM(t.sales_amount) / 984813463) * 100,2),"%") AS persentase_revenue,
        CONCAT(ROUND((SUM(t.profit_margin) / 24657068.40) * 100,2),"%") AS persentase_profit
FROM sales.transactions t
JOIN sales.customers c
ON t.customer_code = c.customer_code
WHERE c.customer_type='E-Commerce'
GROUP BY 1,2
ORDER BY 4 DESC;


-- Perbandingan pelanggan berdasarkan tipe pelanggan

WITH brickmortar AS(
	SELECT c.custmer_name AS brickmortar_customer,
			c.customer_type,
			SUM(t.sales_amount) AS total_revenue_brickmortar,
            ROUND(SUM(t.profit_margin),2) AS total_profit_brickmortar,
            CONCAT(ROUND((SUM(t.sales_amount) / 984813463) * 100,2), "%") AS brickmortar_total_revenue,
            CONCAT(ROUND((SUM(t.profit_margin) / 24657068.40) * 100,2), "%") AS brickmortar_total_profit,
            ROW_NUMBER() OVER(ORDER BY SUM(t.profit_margin) DESC) AS num
	FROM sales.transactions t
	JOIN sales.customers c
	ON t.customer_code = c.customer_code
	WHERE c.customer_type='Brick & Mortar'
	GROUP BY 1,2
	ORDER BY 4 DESC
), ecommerce AS(
	SELECT c.custmer_name AS ecommer_customer,
			c.customer_type,
			SUM(t.sales_amount) AS total_revenue_ecommers,
            ROUND(SUM(t.profit_margin),2) AS total_profit_ecommers,
            CONCAT(ROUND((SUM(t.sales_amount) / 984813463) * 100,2), "%") AS ecommerce_total_revenue,
            CONCAT(ROUND((SUM(t.profit_margin) / 24657068.40) * 100,2), "%") AS ecommerce_total_profit,
            ROW_NUMBER() OVER(ORDER BY SUM(t.profit_margin) DESC) AS num
	FROM sales.transactions t
	JOIN sales.customers c
	ON t.customer_code = c.customer_code
	WHERE c.customer_type='E-Commerce'
	GROUP BY 1,2
	ORDER BY 3 DESC
)
SELECT b.num AS ranking_number,
		b.brickmortar_customer,
		b.total_revenue_brickmortar,
        b.total_profit_brickmortar,
        b.brickmortar_total_revenue,
        b.brickmortar_total_profit,
		e.ecommer_customer,
        e.total_revenue_ecommers,
        e.total_profit_ecommers,
        e.ecommerce_total_revenue,
        e.ecommerce_total_profit
FROM ecommerce e
JOIN brickmortar b
ON e.num=b.num
;

/*
! Catatan:
Pada 'Brick & Mortar' pelanggan bernama Electricalsara Stores mendominasi dengan 41.97% penjualan
hal ini membuat perbandingan antara 'Brick & Mortar' dan 'E-Commerce' terlihat tidak seimbang (3:1)
padahal secara keseluruhan, semua pelanggan memiliki distribusi yang seimbang
*/


/*
Dimensi markets:
--
1. Market terbaik berdasarkan penjualan
2. Market terbaik berdasarkan kuantitas barang
3. Pelanggan terbanyak pada zona terbaik berdasarkan penjualan
4. Tipe pelanggan pada zona terbaik berdarkan kuantitas (persentase rasio antara 'Brick & Mortar' dan 'E-Commerce')
5. Apakah ada korelasi antara zona dan tipe pelanggan??

!!
Tentukan seberapa berpengaruh Market diluar India pada proses analisa
jika dibawah 5% maka bisa dihilangkan
*/

SELECT markets_name
FROM sales.markets
-- WHERE zone = "South"
-- WHERE zone = "North"
WHERE zone = "Central";

-- Market terbaik berdasarkan penjualan

SELECT m.markets_name,
		SUM(t.sales_amount) AS total_revenue,
        ROUND(SUM(t.profit_margin),2) AS total_profit,
		CONCAT(ROUND((SUM(t.sales_amount) / 984813463) * 100,2), "%") AS ecommerce_total_revenue,
		CONCAT(ROUND((SUM(t.profit_margin) / 24657068.40) * 100,2), "%") AS ecommerce_total_profit,
		ROW_NUMBER() OVER(ORDER BY ROUND((SUM(t.profit_margin) / 24657068.40) * 100,2) DESC) AS num
FROM sales.transactions t
JOIN sales.markets m
ON t.market_code=m.markets_code
GROUP BY 1
ORDER BY num ASC;


-- Market terbaik berdasarkan kuantitas barang

SELECT m.markets_name,
		SUM(t.sales_qty) AS total_unit,
        ROUND(SUM(t.cost_price),2) AS total_cost,
        ROUND(SUM(t.profit_margin),2) AS total_profit
FROM sales.transactions t
JOIN sales.markets m
ON t.market_code=m.markets_code
GROUP BY 1
ORDER BY 3 DESC;


-- Pelanggan terbaik pada zona terbaik berdasarkan penjualan

SELECT m.zone,
		COUNT(DISTINCT(markets_code)) AS total_market,
        SUM(t.sales_qty) AS total_quantity,
		SUM(t.sales_amount) AS total_revenue,
        ROUND(SUM(t.profit_margin),2) AS total_profit,
        CONCAT(ROUND((SUM(t.sales_amount) / 984813463) * 100,2), "%") AS sales_magnitude,
        CONCAT(ROUND((SUM(t.profit_margin) / 24657068.40) * 100, 2), "%") AS profit_magnitude
FROM sales.transactions t
JOIN sales.markets m
ON t.market_code=m.markets_code
GROUP BY 1
ORDER BY 5 DESC;
-- Zona north memiliki dominasi yang signifikan, kenapa?
SELECT m.zone,
		m.markets_name,
		SUM(t.sales_qty) AS total_quantity,
		SUM(t.sales_amount) AS total_sales,
        ROUND(SUM(t.profit_margin),2) AS total_profit,
        CONCAT(ROUND((SUM(t.sales_amount) / 984813463) * 100,2), "%") AS revenue_magnitude,
        CONCAT(ROUND((SUM(t.profit_margin) / 24657068.40) * 100, 2), "%") AS profit_magnitude
FROM sales.transactions t
JOIN sales.markets m
ON t.market_code=m.markets_code
GROUP BY 1,2
ORDER BY 5 DESC;


-- Tipe pelanggan pada zona terbaik berdarkan kuantitas (persentase rasio antara 'Brick & Mortar' dan 'E-Commerce')

WITH north_transaction AS(
	SELECT t.*
	FROM sales.transactions t
	JOIN sales.markets m
	ON t.market_code=m.markets_code
	WHERE m.zone="North"
)
SELECT m.customer_type,
		SUM(nt.sales_qty) AS amount_quantity,
        SUM(nt.sales_amount) AS total_sales,
        ROUND(SUM(nt.profit_margin),2) AS total_profit,
        CONCAT(ROUND((SUM(nt.sales_amount) / 984813463) * 100,2), "%") AS revenue_magnitude,
        CONCAT(ROUND((SUM(nt.profit_margin) / 24657068.40) * 100, 2), "%") AS profit_magnitude
FROM north_transaction nt
JOIN sales.customers m
ON nt.customer_code = m.customer_code
GROUP BY 1;


-- Apakah ada korelasi antara zona dan tipe pelanggan??

WITH zone_transaction AS(
	SELECT t.*,
			m.*
	FROM sales.transactions t
	JOIN sales.markets m
	ON t.market_code=m.markets_code
)
SELECT zt.zone,
		m.customer_type,
		m.custmer_name
FROM zone_transaction zt
JOIN sales.customers m
ON zt.customer_code = m.customer_code
WHERE zt.zone = "Central"
GROUP BY 1,2,3
;


-- Pengaruh Market di luar India terhadap penjualan secara keseluruhan

WITH total AS(
SELECT SUM(sales_amount) AS total_sales,
		ROW_NUMBER() OVER() AS num
FROM sales.transactions
), usd_total AS(
SELECT SUM(sales_amount * 88) AS total_usd,
		ROW_NUMBER() OVER() as num
FROM sales.transactions
WHERE currency = "USD"
)
SELECT total.total_sales,
		usd_total.total_usd,
        CONCAT(ROUND((usd_total.total_usd / total.total_sales) * 100, 4), "%") AS percentage
FROM total
JOIN usd_total
ON total.num=usd_total.num;


/*
Dimensi products:
--
1. Tipe produk terbaik berdasarkan penjualan
--
1. Tipe produk yang diminati market terbaik
2. Tipe produk yang diminati customer terbaik
*/


-- Tipe produk terbaik berdasarkan penjualan

SELECT p.product_type,
			SUM(t.sales_amount) AS total_pemasukan,
			SUM(t.sales_qty) AS total_unit_terjual,
			ROUND(SUM(t.profit_margin),2) AS total_keuntungan,
			CONCAT(ROUND((SUM(t.sales_amount) / 984813463) * 100,2), "%") AS magnitude_pemasukan,
			CONCAT(ROUND((SUM(t.profit_margin) / 24657068.40) * 100, 2), "%") AS magnitude_keuntungan
FROM sales.transactions t
JOIN sales.products p
ON t.product_code=p.product_code
WHERE p.product_type LIKE '%Distribution%'
GROUP BY 1
;

SELECT COUNT(*)
FROM sales.products
WHERE product_type LIKE '%Own Brand%';

SELECT p.product_code,
		p.product_type,
			SUM(t.sales_amount) AS total_pemasukan,
			SUM(t.sales_qty) AS total_unit_terjual,
			ROUND(SUM(t.profit_margin),2) AS total_keuntungan,
			CONCAT(ROUND((SUM(t.sales_amount) / 984813463) * 100,2), "%") AS magnitude_pemasukan,
			CONCAT(ROUND((SUM(t.profit_margin) / 24657068.40) * 100, 2), "%") AS magnitude_keuntungan
FROM sales.transactions t
JOIN sales.products p
ON t.product_code=p.product_code
GROUP BY 1,2
ORDER BY 6 DESC


WITH amount_product AS (
	SELECT product_type,
			COUNT(*) AS jumlah_product
	FROM sales.products
	WHERE product_type LIKE '%Own Brand%'
	GROUP BY 1
	union
	SELECT product_type,
			COUNT(*) AS jumlah_product
	FROM sales.products
	WHERE product_type LIKE '%Distribution%'
	GROUP BY 1
), product_transaction AS (
	SELECT p.product_type,
			SUM(sales_amount) AS total_pemasukan,
			SUM(sales_qty) AS total_unit_terjual,
			ROUND(SUM(profit_margin),2) AS total_keuntungan,
			CONCAT(ROUND((SUM(sales_amount) / 984813463) * 100,2), "%") AS magnitude_pemasukan,
			CONCAT(ROUND((SUM(profit_margin) / 24657068.40) * 100, 2), "%") AS magnitude_keuntungan
	FROM sales.transactions t
	JOIN sales.products p
	ON t.product_code=p.product_code
	GROUP BY 1
)
SELECT ap.product_type,
		ap.jumlah_product,
        pt.total_pemasukan,
        pt.total_unit_terjual,
        pt.total_keuntungan,
        pt.magnitude_pemasukan,
        pt.magnitude_keuntungan
FROM amount_product ap
JOIN product_transaction pt
ON ap.product_type=pt.product_type
;


-- Tipe produk yang diminati masing-masing market

WITH market_product AS(
	SELECT t.product_code,
			m.markets_name
	FROM sales.transactions t
	JOIN sales.markets m
	ON t.market_code=m.markets_code
), market_type AS(
SELECT mp.markets_name,
		mp.product_code,
        p.product_type
FROM sales.products p
JOIN market_product mp
ON p.product_code= mp.product_code
), market_distribusi AS (
SELECT markets_name,
		COUNT(*) AS jumlah_produk_tipe_distribusi
FROM market_type
WHERE product_type LIKE '%Distribution%'
GROUP BY 1
), market_own_brand AS (
SELECT markets_name,
		COUNT(*) AS jumlah_produk_tipe_own_brand
FROM market_type
WHERE product_type LIKE '%Own Brand%'
GROUP BY 1
)
SELECT md.markets_name,
		md.jumlah_produk_tipe_distribusi,
        mo.jumlah_produk_tipe_own_brand
FROM market_distribusi md
JOIN market_own_brand mo
ON md.markets_name=mo.markets_name
;


WITH yearly_sales AS(
	SELECT YEAR(t.order_date) AS tahun_pemesanan,
			p.product_code AS produk,
            ROUND(SUM(profit_margin),2) AS profit_sekarang
    FROM sales.transactions t
    JOIN sales.products p
    ON t.product_code=p.product_code
    GROUP BY 1,2
    ORDER BY 3 DESC
    LIMIT 10
)
SELECT tahun_pemesanan,
		produk,
        profit_sekarang,
        ROUND(AVG(profit_sekarang) OVER(PARTITION BY produk),2) AS avg_profit,
        ROUND(profit_sekarang - AVG(profit_sekarang) OVER(PARTITION BY produk),2) AS selisih_avg,
        CASE
			WHEN profit_sekarang - AVG(profit_sekarang) OVER(PARTITION BY produk) > 0 THEN "Diatas Rata-rata"
            WHEN profit_sekarang - AVG(profit_sekarang) OVER(PARTITION BY produk) < 0 THEN "Dibawah Rata-rata"
            ELSE "Tidak ada Perubahan"
		END AS perubahan_avg,
        LAG(profit_sekarang) OVER(PARTITION BY produk ORDER BY tahun_pemesanan) AS penjualan_tahun_sebelum,
        ROUND(profit_sekarang - LAG(profit_sekarang) OVER(PARTITION BY produk ORDER BY tahun_pemesanan),2) AS perbedaan_profit,
		CASE
			WHEN profit_sekarang - LAG(profit_sekarang) OVER(PARTITION BY produk ORDER BY tahun_pemesanan) > 0 THEN "Naik"
            WHEN profit_sekarang - LAG(profit_sekarang) OVER(PARTITION BY produk ORDER BY tahun_pemesanan) < 0 THEN "Turun"
            ELSE "Tidak ada Perubahan"
		END AS perubahan_tahun_lalu
FROM yearly_sales
ORDER BY 2,1
;

-- Tipe produk yang diminati customer

WITH customer_product AS(
	SELECT t.product_code,
			c.customer_code,
			c.custmer_name AS customer_name
	FROM sales.transactions t
	JOIN sales.customers c
	ON t.customer_code=c.customer_code
), type_customer AS(
SELECT 	p.product_type,
        p.product_code,
        cp.customer_name
FROM sales.products p
JOIN customer_product cp
ON p.product_code=cp.product_code
), customer_distribution AS(
	SELECT customer_name,
			COUNT(product_type) AS total_product_distribution
	FROM type_customer
	WHERE product_type LIKE "%Distribution%"
	GROUP BY 1
), customer_ownbrand AS(
	SELECT customer_name,
			COUNT(product_type) AS total_product_ownbrand
	FROM type_customer
	WHERE product_type LIKE "%Own Brand%"
	GROUP BY 1
)
SELECT cd.customer_name,
		cd.total_product_distribution,
		co.total_product_ownbrand
FROM customer_distribution cd
JOIN customer_ownbrand co
ON cd.customer_name=co.customer_name
;

/*Analisa untuk Electricalsara Stores*/
SELECT c.custmer_name,
		-- YEAR(t.order_date) AS tahun,
		MONTH(t.order_date) AS bulan,
		SUM(t.sales_amount) AS total_pemasukan,
		SUM(t.sales_qty) AS total_unit_terjual,
		ROUND(SUM(t.profit_margin),2) AS total_keuntungan,
		CONCAT(ROUND((SUM(t.sales_amount) / 984813463) * 100,2), "%") AS magnitude_pemasukan,
		CONCAT(ROUND((SUM(t.profit_margin) / 24657068.40) * 100, 2), "%") AS magnitude_keuntungan
FROM sales.transactions t
JOIN sales.customers c
ON t.customer_code=c.customer_code
WHERE custmer_name = "Electricalsara Stores"
GROUP BY 1,2
ORDER BY 2 ASC
;

-- Kinerja Electricalsara Stores berdasarkan tipe produk

WITH product_electricalsara AS(
	SELECT c.custmer_name,
			t.product_code,
			SUM(t.sales_amount) AS total_pemasukan,
			SUM(t.sales_qty) AS total_unit_terjual,
			ROUND(SUM(t.profit_margin),2) AS total_keuntungan,
			CONCAT(ROUND((SUM(t.sales_amount) / 984813463) * 100,2), "%") AS magnitude_pemasukan,
			CONCAT(ROUND((SUM(t.profit_margin) / 24657068.40) * 100, 2), "%") AS magnitude_keuntungan
	FROM sales.transactions t
	JOIN sales.customers c
	ON t.customer_code=c.customer_code
	WHERE custmer_name = "Electricalsara Stores"
	GROUP BY 1,2
	ORDER BY 5 DESC
)
SELECT es.custmer_name,
            p.product_type,
			SUM(es.total_pemasukan) AS total_pemasukan,
			SUM(es.total_unit_terjual) AS total_unit_terjual,
			ROUND(SUM(es.total_keuntungan),2) AS total_keuntungan,
			CONCAT(ROUND((SUM(es.total_pemasukan) / 984813463) * 100,2), "%") AS magnitude_pemasukan,
			CONCAT(ROUND((SUM(es.total_keuntungan) / 24657068.40) * 100, 2), "%") AS magnitude_keuntungan
FROM product_electricalsara es
JOIN sales.products p
ON es.product_code = p.product_code
GROUP BY 1,2
;


/*
Dimensi date:
--
1. Periode data (tanggal paling awal dan akhir)
2. Market terbaik pada setiap bulan berdasarkan penjualan dan kuantitas
3. Produk terbaik pada setiap bulan berdasarkan penjualan dan kuantitas
4. Pelanggan terbaik pada setiap bulan berdasarkan penjualan dan kuantitas
(apakah ada pola dimana produk pada bulan tertentu akan diminati?, begitu juga dengan market dan Pelanggan)

--
!! Catatan untuk Musim:
Departemen meteorologi negara itu mengikuti empat musim dengan beberapa penyesuaian lokal: 
1. musim dingin (Desember hingga Februari), 
2.panas(Maret hingga Mei)
3.hujan (Juni hingga September)
4.pasca-musim hujan(Oktober hingga November). 

Beberapa bagian negara dengan iklim subtropis,
sedang atau kontinental juga mengalami musim semi dan musim gugur.

Cek apakah market yang ada didalam data termasuk pada pembagian iklim yang mana??
cari korelasi berdasarkan musim/iklim
*/


SELECT MIN(order_date) AS transaksi_pertama,
		MAX(order_date) AS transaksi_terakhir
FROM sales.transactions;

-- Periode data (tanggal paling awal dan akhir) untuk penjualan produk dan pelanggan

SELECT product_code,
		MIN(order_date) AS first_order,
        MAX(order_date) AS last_order
FROM sales.transactions
GROUP BY 1
ORDER BY 2;

SELECT custmer_name,
		MIN(order_date) AS first_order,
        MAX(order_date) AS last_order,
        MAX(order_date) - MIN(order_date) AS range_date
FROM sales.transactions t
JOIN sales.customers c
ON t.customer_code=c.customer_code
GROUP BY 1
ORDER BY 3;


-- Market terbaik pada setiap bulan berdasarkan penjualan dan kuantitas

SELECT -- YEAR(t.order_date) AS tahun,
		MONTH(order_date) AS bulan,
		SUM(sales_amount) AS total_pemasukan,
		SUM(sales_qty) AS total_unit_terjual,
		ROUND(SUM(profit_margin),2) AS total_keuntungan,
		CONCAT(ROUND((SUM(sales_amount) / 984813463) * 100,2), "%") AS magnitude_pemasukan,
		CONCAT(ROUND((SUM(profit_margin) / 24657068.40) * 100, 2), "%") AS magnitude_keuntungan
FROM sales.transactions
GROUP BY 1
ORDER BY 1 ASC

;


WITH selected_period AS(
	SELECT m.markets_name,
			YEAR(order_date) AS tahun,
			MONTH(order_date) AS bulan,
			SUM(sales_amount) AS total_revenue,
			SUM(profit_margin) AS total_profit
	FROM sales.transactions t
	JOIN sales.markets m
	ON t.market_code=m.markets_code
	GROUP BY 1,2,3
)
SELECT 	tahun,
        bulan,
        markets_name,
        total_revenue,
        total_profit,
        ROUND(SUM(total_profit) OVER (PARTITION BY tahun ORDER BY tahun, bulan, markets_name),2) AS running_profit
FROM selected_period
;


-- Produk terbaik pada setiap bulan berdasarkan penjualan dan kuantitas

WITH selected AS(
	SELECT product_code,
			YEAR(order_date) AS tahun,
			MONTH(order_date) AS bulan,
			SUM(sales_amount) AS total_revenue,
			ROUND(SUM(profit_margin),2) AS total_margin
	FROM sales.transactions
	GROUP BY 1,2,3
)
SELECT 	tahun,
        bulan,
        product_code,
        MAX(total_margin)
FROM selected
GROUP BY 1,2,3
;


-- Analisa performa setiap tahun dari tipe produk dengan membandingkan setiap produk dengan rata-rata performa
-- penjualan pada bulan sebelumnya

WITH yearly_sales AS(
	SELECT YEAR(t.order_date) AS tahun_pemesanan,
			p.product_type AS tipe_produk,
            ROUND(SUM(profit_margin),2) AS profit_sekarang
    FROM sales.transactions t
    JOIN sales.products p
    ON t.product_code=p.product_code
    GROUP BY 1,2
)
SELECT tahun_pemesanan,
		tipe_produk,
        profit_sekarang,
        ROUND(AVG(profit_sekarang) OVER(PARTITION BY tipe_produk),2) AS avg_profit,
        ROUND(profit_sekarang - AVG(profit_sekarang) OVER(PARTITION BY tipe_produk),2) AS selisih_avg,
        CASE
			WHEN profit_sekarang - AVG(profit_sekarang) OVER(PARTITION BY tipe_produk) > 0 THEN "Diatas Rata-rata"
            WHEN profit_sekarang - AVG(profit_sekarang) OVER(PARTITION BY tipe_produk) < 0 THEN "Dibawah Rata-rata"
            ELSE "Tidak ada Perubahan"
		END AS perubahan_avg,
        LAG(profit_sekarang) OVER(PARTITION BY tipe_produk ORDER BY tahun_pemesanan) AS penjualan_tahun_sebelum,
        ROUND(profit_sekarang - LAG(profit_sekarang) OVER(PARTITION BY tipe_produk ORDER BY tahun_pemesanan),2) AS perbedaan_profit,
		CASE
			WHEN profit_sekarang - LAG(profit_sekarang) OVER(PARTITION BY tipe_produk ORDER BY tahun_pemesanan) > 0 THEN "Naik"
            WHEN profit_sekarang - LAG(profit_sekarang) OVER(PARTITION BY tipe_produk ORDER BY tahun_pemesanan) < 0 THEN "Turun"
            ELSE "Tidak ada Perubahan"
		END AS perubahan_tahun_lalu
FROM yearly_sales
ORDER BY 2,1
;


-- Penjualan berdasarkan musim

WITH nama_musim AS(
	SELECT *,
			CASE
				WHEN month_name = 'December' THEN "Dingi"
				WHEN month_name = 'January' THEN "Dingi"
				WHEN month_name = 'February' THEN "Dingi"
				WHEN month_name = 'March' THEN "Panas"
				WHEN month_name = 'April' THEN "Panas"
				WHEN month_name = 'May' THEN "Panas"
				WHEN month_name = 'June' THEN "Hujan"
				WHEN month_name = 'July' THEN "Hujan"
				WHEN month_name = 'August' THEN "Hujan"
				WHEN month_name = 'September' THEN "Hujan"
				WHEN month_name = 'October' THEN "Pasca Hujan"
				WHEN month_name = 'November' THEN "Pasca Hujan"
			END AS musim
	FROM sales.date
)
SELECT nm.musim,
		SUM(t.sales_amount) AS total_revenue,
        ROUND(SUM(t.profit_margin),2) AS total_profit,
		CONCAT(ROUND((SUM(sales_amount) / 984813463) * 100,2), "%") AS magnitude_revenue,
		CONCAT(ROUND((SUM(profit_margin) / 24657068.40) * 100, 2), "%") AS magnitude_profit
FROM sales.transactions t
JOIN nama_musim nm
ON t.order_date=nm.date
GROUP BY 1;