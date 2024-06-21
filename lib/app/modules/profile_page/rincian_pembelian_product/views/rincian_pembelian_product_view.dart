import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rincian_pembelian_product_controller.dart';

class RincianPembelianProductView
    extends GetView<RincianPembelianProductController> {
  const RincianPembelianProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Pembelian',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Informasi Pesanan',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'No Pesanan',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '731VCRVF312CB',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Tanggal Pembelian',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '18 Jul 2023, 11:52 WIB',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/batik tibodunyo.png', // Replace with actual image path
                        width: 135,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Batik Endek Bali',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Hitam, S',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                      width:
                                          130), // Jarak antara teks "Hitam, S" dan "1x"
                                  Text(
                                    '1x',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:
                                      8), // Jarak antara baris pertama dan baris kedua
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Total Pesanan',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                'IDR 199.000',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFBC0C24),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Info Pengiriman',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Kurir',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'JNE - OKE',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'No Resi',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'TLX3142AMLQTF',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Alamat',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Bessotu Ittok\n081341432592\nJl. Mawar Hitam Nomor 33, Kel. Gunung Sari, Kec. Dukuh Pakis, Surabaya, Jawa Timur 69124',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Metode Pembayaran',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Image.asset(
                    'assets/images/linkaja.jpg',
                    width: 50,
                    height: 35.71,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Link Aja',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Ringkasan Pemesanan',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Sub Total',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Rp. 75.000',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Admin Fee',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Rp. 5.000',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Total',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14),
                  ),
                  Text(
                    'Rp. 80.000',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Beli Lagi',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBC0C24),
                    minimumSize: const Size(360, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
