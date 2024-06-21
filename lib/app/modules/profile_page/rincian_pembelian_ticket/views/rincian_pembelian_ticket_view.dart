import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rincian_pembelian_ticket_controller.dart';

class RincianPembelianTicketView
    extends GetView<RincianPembelianTicketController> {
  const RincianPembelianTicketView({Key? key}) : super(key: key);

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
      body: Padding(
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
            const SizedBox(height: 10), // Jarak tambahan antar teks
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
            const SizedBox(height: 20), // Jarak tambahan antar teks
            Container(
              width: 430,
              height: 166,
              padding: EdgeInsets.fromLTRB(
                  16, 10, 16, 10), // Padding: atas, kanan, bawah, kiri
              margin: EdgeInsets.symmetric(
                  vertical: 11), // Jarak vertikal antara card jika diperlukan
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: 1,
                      color: Colors.white), // Border atas tebal 1px hitam
                  bottom: BorderSide(
                      width: 1,
                      color: Colors.white), // Border bawah tebal 1px hitam
                ),
                borderRadius: BorderRadius.circular(
                    8), // Border radius sudut card (jika perlu)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/images/festival.png', // Replace with actual image path
                      width: 160,
                      height: 137,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Pergelaran Wayang Kulit Tradisional Indonesia',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11, // Adjusted font size for title
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'VVIP LEFT',
                              style: TextStyle(
                                  fontSize: 11), // Adjusted font size for text
                            ),
                            Text(
                              '1x',
                              style: TextStyle(
                                  fontSize: 11), // Adjusted font size for text
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'REGULER',
                              style: TextStyle(
                                  fontSize: 11), // Adjusted font size for text
                            ),
                            Text(
                              '2x',
                              style: TextStyle(
                                  fontSize: 11), // Adjusted font size for text
                            ),
                          ],
                        ),
                        // Add Spacer to push the total price to the bottom
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 15), // Memberikan jarak dari atas
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Total Pesanan',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  'IDR 170.000',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFFBC0C24),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Jarak tambahan antar teks
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
                  'assets/images/linkaja.jpg', // Replace with actual image URL
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
            const SizedBox(height: 16), // Jarak tambahan antar teks
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
            SizedBox(height: 10),
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
            SizedBox(height: 10),
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
            const SizedBox(height: 150), // Jarak tambahan antar teks
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
          ],
        ),
      ),
    );
  }
}
