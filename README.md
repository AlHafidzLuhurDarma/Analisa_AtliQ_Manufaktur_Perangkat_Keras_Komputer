# Laporan Performa AtliQ.Co

## Daftar Isi:
*	Laporan Eksekutif
*	Tujuan
*	Deskripsi Data
*	Laporan Kinerja:
    *	Performa Menyeluruh
    *	Penjualan Produk
    *	Periode Terbaik
    *	Demografi Pelanggan
    *	Performa Wilayah
*	Perhatian Lebih:
    *	Anomali pada Pelanggan
*	Rekomendasi
*	Kekurangan dan Peringatan


## Laporan Eksekutif

AtliQ.Co merupakan Perusahaan  manufaktur perangkat keras dan perangkat tambahan computer dengan distributor atau pelanggan yang tersebar dalam India. Penjualan medapatkan revenue sebesar ₹985 M profit total senilai ₹24.5 M. Puncak penjualan ada pada 1 Januari 2019 dengan revenue senilai ₹2,7 M dan profit sebesar ₹1.5 M dan Pelanggan Electricalsara Stores mendominasi sumber keuangan AtliQ.Co dengan  37% total profit, data pelanggan tersebut juga membuat wilayah Central terlihat sebagai wilayah paling menguntungkan .Produk dengan kode Prod329 menjadi yang paling diminati oleh Electricalsara Stores dan Prod040 paling diminati secara menyeluruh dengan profit ₹1M. AtliQ.Co menyediakan data dalam rentang waktu dari 4 Oktober 2017 sampai 26 Juni 2020.

<p align="center">
  <img src="https://github.com/AlHafidzLuhurDarma/Analisa_AtliQ_Manufaktur_Perangkat_Keras_Komputer/blob/main/gambar/Screenshot%202025-10-13%20121334.png" width=600 height=400>
</p>

## Tujuan
Tujuan laporan ini adalah untuk menganalisis performa penjualan dan profitabilitas perusahaan AtliQ.Co, sebuah perusahaan manufaktur perangkat keras komputer, dalam periode 4 Oktober 2017 hingga 26 Juni 2020. Analisa ini bertujuan untuk:
*	Mengidentifikasi pelanggan, wilayah, dan produk dengan kontribusi profit tertinggi.
*	Menentukan periode waktu terbaik bagi perusahaan dalam hal performa keuangan.
*	Mengevaluasi efisiensi distribusi dan tipe produk (Own Brand vs Distribution).
*	Menyediakan insight bisnis dan rekomendasi strategis untuk meningkatkan profit di masa depan.

## Deskripsi Data

<p align="center">
  <img src="https://github.com/AlHafidzLuhurDarma/Analisa_AtliQ_Manufaktur_Perangkat_Keras_Komputer/blob/main/gambar/Screenshot%202025-10-12%20102139.png" width=700 height=500>
</p>

Data yang dianalisis merupakan data internal perusahaan AtliQ.Co dalam rentang Q4 2017 – Q2 2020, mencakup informasi transaksi penjualan dan profit dari berbagai pelanggan dan produk. Data disajikan dalam bentuk tabel relasional dengan entitas utama berikut:
*	**Customer**, berisi data distributor/toko pelanggan (nama, tipe pelanggan, wilayah).
*	**Market**, berisi data wilayah pemasaran yang menghubungkan pelanggan dengan zona geografis (North, South, East, Central).
*	**Product**, berisi informasi produk seperti kode produk, tipe (Own Brand / Distribution), serta harga jual.
*	**Sales**, berisi transaksi penjualan, termasuk order date, order number, revenue, dan profit.


Laporan Kinerja

*	**Performa Menyeluh:** Penjualan medapatkan profit tertinggi pada 1 Januari 2019 dengan revenue senilai ₹2,7 M dan profit sebesar ₹1.5 M dan Pelanggan Electricalsara Stores mendominasi sumber keuangan AtliQ.Co dengan  37% total profit, data pelanggan tersebut juga membuat wilayah Central terlihat sebagai wilayah paling menguntungkan .Produk dengan kode Prod329 menjadi yang paling diminati oleh Electricalsara Stores dan Prod040 paling diminati secara menyeluruh dengan profit ₹1M. AtliQ.Co menyediakan data dalam rentang waktu dari 4 Oktober 2017 sampai 26 Juni 2020.

<p align="center">
  <img src="https://github.com/AlHafidzLuhurDarma/Analisa_AtliQ_Manufaktur_Perangkat_Keras_Komputer/blob/main/gambar/Screenshot%202025-10-13%20112835.png" width=600 height=400>
</p>
  
*	Penjualan Produk: AtliQ.Co memiliki 279 Produk dengan 88 produk tipe Distribution dan 191 Produk bertipe Own Brand. Produk dengan kode Prod040 dengan tipe Own Brand menjadi produk yang memiliki profit paling tinggi dengan ₹1M  (4.6% dari profit produk keseluruhan). 
      *	**Produk Own Brand**,  menghasilkan revenue ₹55M dengan profit ₹2.1M. Tipe ini mengalami puncak penjualan pada 1 Januari 2018 dengan revenue nilai ₹4.3M dan profit ₹86K. 
      *	**Produk Distribution**, menghasilkan revenue ₹18M dengan profit ₹257K. Tipe ini mengalami puncak penjualan pada 1 Januari 2018 dengan revenue nilai ₹3.6M dan profit ₹86K.
      *	Pada data yang disediakan, terdapat 83% catatan produk tanpa keterangan tipe produk. Hal ini membuat Analisa tentang tipe produk menjadi tidak signifikan.


*	Periode Terbaik: Perlu diperhatikan, data hanya memiliki catatan dari 4 Oktober 2017 sampai 26 Juni 2020 (Q1, 2017 – Q2, 2020), sehingga terdapat limitasi akan analisa terhadap pola kenaikan dari berbagai variabel
    *	**Tahun**, tahun terbaik ada pada 2018 dengan ₹8M, dengan kenaikan sebesar 7% dari tahun sebelumnya sebesar menyumbangkan ₹2,7 M.
    *	**Kuartal**, Kuartal ke-3 selalu menghasilkan pertumbuhan profit tertinggi dengan kenaikan 165% atau senilai ₹2,4 M pada tahun 2018 dan 5% pada tahun 2019 dengan nilai ₹2,4 M. Walaupun pada 2018 dan 201 nilai profit yang dihasilkan sama, namun penurunan profit pada Kuartal ke-2 2018 adalah yang terkecil dalam catatan, hanya senilai ₹9K atau -71% penurunan dari kuartal pertama 2018.
    *	**Musim**, Musim dingin (Desember-Februari) menghasilkan profit tertinggi dengan ₹8M, sebesar 33% dari total profit. Sedangkan Pasca-hujan adalah yang terendah dengan profit ₹5M, atau 20.3% dari total profit. Tidak ada perbedaan signifikan terhadap musim, sepertinya musim tidak terlalu mempengaruhi keinginan pelanggan.
    *	**Bulan**, Bulan Januari dan November selalu menjadi bulan paling menguntungkan di setiap tahun. Total revenue yang dihasilkan di bulan Januari selama 4 tahun adalah ₹99M dengan profit ₹2.8M, sedangkan November dalam waktu 3 tahun menghasilkan revenue ₹92M dengan profit ₹3M. Bulan Juni menjadi bulan paling berat setiap tahunnya, total penjualan pada bulan Juni selama 3 tahun hanya menghasilkan profit ₹1M.

<p align="center">
  <img src="https://github.com/AlHafidzLuhurDarma/Analisa_AtliQ_Manufaktur_Perangkat_Keras_Komputer/blob/main/gambar/pertumbuhan%20per%20bulan.png" width=700 height=400>
  <img src="https://github.com/AlHafidzLuhurDarma/Analisa_AtliQ_Manufaktur_Perangkat_Keras_Komputer/blob/main/gambar/pertumbuhan%20per%20tahun.png" width=800 heigh=400>
</p>

*	Demografi Pelanggan: Pelanggan AtliQ.Co bukan perseorangan, melainkan Distributor atau sebuah toko yang tersebar di India (dan luar India) dengan total 38 Pelanggan dengan 19 bertipe E-Commerce dan 19 bertipe Brick & Mortar.
    *	Secara keseluruhan, Pelanggan bertipe Brick & Mortar menghasilkan revenue ₹744M dan profit sebesar ₹16M. Toko Electricalsara Stores memberikan kontribusi terbesar terhadap pelanggan tipe Brick & Mortar dengan profit ₹9.3M (37% profit Brick & Mortar), disusul oleh Premium Stores dengan profit ₹1M (4.2% profit Brick& Mortar).
    *	Untuk tipe E-Commerce, menghasilkan revenue ₹24M dengan profit senilai ₹8.5M. Distribusi terkait profit yang dihasilkan cukup seimbang dibandingkan Brick & Mortar (karena ada Electricalsara Stores) dengan Toko Nixon memberikan kontribusi terbesar terhadap pelanggan tipe Brick & Mortar dengan profit ₹1.7M (7.2% profit E-Commerce).


*	Performa Wilayah: Pelanggan bernama Electricalsara Shop berada di wilayah Delhi NCR, pelanggan ini mengambil revenue dan profit yang sangat besar, sehingga kota Delhi NCR memiliki 52% dari total revenue (₹51 M) dan 48% dari total profit (₹11 M).
    *	Data distribusi secara wilayah dikuasi oleh zona North(Utara) yang memiliki 6 total market dan berhasil menjual sebanyak 1.2 M unit sehingga menghasilkan revenue total senilai ₹67 M dan memiliki profit ₹15 M. Zona North menguasai penjualan dengan 68% dari total penjualan(Hal ini dikarenakan wilayah Delhi NCR ada di zona north).
    *	Ketika Pelanggan Electricalsara Shop dihilangkan(untuk menormalisasi distribusi), Zona North tetap mendominasi setiap tahun dengan titik puncaknya pada 2019 dengan menguasai 67% profit pada tahun tersebut.
    *	 Zona Timur(South) menjadi yang paling lemah, walaupun memiliki 5 market, namun hanya bisa menyumbangkan kurang dari 5% pada total revenue dengan ₹45 M maupun total profit dengan ₹1 M.

<p>
  <img src="https://github.com/AlHafidzLuhurDarma/Analisa_AtliQ_Manufaktur_Perangkat_Keras_Komputer/blob/main/gambar/profit%20zona%20tahun.png" width=600 height=400>
  <img src="https://github.com/AlHafidzLuhurDarma/Analisa_AtliQ_Manufaktur_Perangkat_Keras_Komputer/blob/main/gambar/zona.png" width=700 height=400>
</p>

## Perhatian Lebih	
**Anomali pada Pelanggan,** Distribusi pada pelanggan/customer menjadi perhatian utama selama proses analisis, terutama pada kasus Electricalsara Stores yang terlalu mendominasi profit. Proses menemukan anomali menggunakan metode K-Means Clustering dalam 3 kluster.
  *	**Kluster 1,** memiliki 14 pelanggan dengan rata-rata revenue ₹17 M dan profit margin ₹600K. Kelompok ini jumlahnya tidak banyak namun menghasilkan profitabilitas tinggi terhadap penjualan
  *	**Kluster 2,** memiliki 1 pelanggan dengan rata-rata revenue ₹433 M dan profit margin ₹9 M. Hanya 1 pelanggan namun penjualan jauh diatas rata-rata pelanggan lain
  * **Kluster 3,** memiliki 23 pelanggan dengan rata-rata revenue ₹14 M dan profit margin ₹200K. Kelompok pelanggan dengan pembelian dalam jumlah kecil, namun memberikan kestabilan pada penjualan

<p align="center">
  <img src="" width=600 height=600>
</p>

Berdasarkan pembagian tersebut, ditemukan 4 pelanggan yang dianggap sebagai anomali:

  *	**Electricalsara Stores**, yang satu ini tidak lagi mengejutkan sebab pelanggan ini yang terdeteksi sebagai outlier karena nilainya jauh lebih tinggi dari yang lain.
  *	**Leader**, memiliki profit per sale sangat tinggi (₹48), mungkin menjual produk dengan margin sangat besar atau kesalahan pencatatan harga.
  *	**Premium Stores dan Electricalslytical**, menunjukkan pola berbeda — bisa menjadi pelanggan potensial baru dengan volume besar.


## Rekomendasi
*	Tim Manajemen
    *	Diversifikasi Sumber Pendapatan: Hindari ketergantungan berlebihan pada satu pelanggan utama (Electricalsara Stores) dengan memperluas portofolio pelanggan dan meninjau ulang kebijakan kontrak jangka panjang.
    *	Evaluasi Strategi Wilayah: Fokus pengembangan pasar pada zona South dan East yang masih memiliki potensi pertumbuhan. Berikan dukungan logistik dan distribusi tambahan untuk memperluas jangkauan.
*	Tim Marketing dan Sales
    *	Target Pelanggan Baru: Fokus kampanye promosi pada pelanggan E-Commerce dan Brick & Mortar dengan profil mirip Premium Stores atau Electricalslytical yang berpotensi tinggi.
    *	Optimalisasi Produk Own Brand: Produk bertipe Own Brand terbukti paling menguntungkan. Perkuat strategi branding dan promosi di segmen ini.
    *	Analisis Musiman dan Momentum Penjualan: Gunakan periode Januari dan November sebagai puncak promosi tahunan, karena dua bulan ini secara konsisten menunjukkan profit tertinggi.

## Kekurangan dan Peringatan
*	Keterbatasan Data: Rentang data hanya mencakup periode 2017–2020 sehingga tren jangka panjang tidak dapat diamati.
*	Dominasi Outlier: Pelanggan Electricalsara Stores mendominasi profit, yang dapat menyebabkan bias terhadap kesimpulan umum.
*	Tidak Ada Informasi Eksternal: Faktor eksternal seperti inflasi, harga bahan baku, atau kompetitor tidak termasuk dalam data sehingga hasil analisa hanya mencerminkan performa internal.
*	Potensi Overfitting pada Clustering: Hasil segmentasi pelanggan berbasis K-Means mungkin tidak stabil jika data baru dengan pola berbeda dimasukkan.
