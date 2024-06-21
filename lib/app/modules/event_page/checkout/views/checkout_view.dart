import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/shared/widget/card/card_ticket3.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/action_button.dart';
import 'package:kreasi_nusantara/shared/widget/step_navigation/step_navigation.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          // Tambahkan Center di sini
          child: Container(
            margin: const EdgeInsets.fromLTRB(16.3, 0, 16.3, 11),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Ubah menjadi MainAxisAlignment.center
                    crossAxisAlignment: CrossAxisAlignment
                        .center, // Ubah menjadi CrossAxisAlignment.center
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFEFEF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          padding:
                              const EdgeInsets.fromLTRB(10.2, 10, 10.2, 10),
                          child: Text(
                            '00',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.3,
                              letterSpacing: 0.1,
                              color: const Color(0xFF1B1C20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 13, 0, 13),
                        child: SizedBox(
                          width: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFABABAB),
                                    borderRadius: BorderRadius.circular(1.5),
                                  ),
                                  child: const SizedBox(
                                    width: 3,
                                    height: 3,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFABABAB),
                                  borderRadius: BorderRadius.circular(1.5),
                                ),
                                child: const SizedBox(
                                  width: 3,
                                  height: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFEFEF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          padding:
                              const EdgeInsets.fromLTRB(10.2, 10, 10.2, 10),
                          child: Text(
                            '09',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.3,
                              letterSpacing: 0.1,
                              color: const Color(0xFF1B1C20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 13, 0, 13),
                        child: SizedBox(
                          width: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFABABAB),
                                    borderRadius: BorderRadius.circular(1.5),
                                  ),
                                  child: const SizedBox(
                                    width: 3,
                                    height: 3,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFABABAB),
                                  borderRadius: BorderRadius.circular(1.5),
                                ),
                                child: const SizedBox(
                                  width: 3,
                                  height: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFEFEF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          padding:
                              const EdgeInsets.fromLTRB(10.3, 10, 10.3, 10),
                          child: Text(
                            '59',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.3,
                              letterSpacing: 0.1,
                              color: const Color(0xFF1B1C20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(16.2, 10, 10, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Ticket Details',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1.4,
                            letterSpacing: 0.1,
                            color: const Color(0xFF1B1C20),
                          ),
                        ),
                      ),
                    ),
                    const CardTicket3(
                      title: "Pagelaran Wayang Kulit",
                      subtittle: "VVIP RIGHT Ticket 1x",
                      dateTime: "12/01/2024 . 04.00 PM",
                      image: "assets/images/card kecil.png",
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16.2, 20, 16.2, 19),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Select Payment Method',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1.4,
                            letterSpacing: 0.1,
                            color: const Color(0xFF1B1C20),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      padding: const EdgeInsets.fromLTRB(9, 9, 0, 9),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFECECEC)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFE82529),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: SizedBox(
                              width: 50,
                              height: 35.7,
                              child: SizedBox(
                                width: 35.7,
                                height: 11.7,
                                child: Image.network(
                                  'https://1.bp.blogspot.com/-GjCpjdW8Hrs/XkXUvE0RseI/AAAAAAAABmk/u5e1zr7RGHQN2TFwPu1IoN8QJBtwXLH5QCLcBGAsYHQ/s1600/Logo%2BLink%2BAja%2521.png',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Expanded(
                            // Tambahkan Expanded di sini
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 7.9, 0, 7.9),
                              child: Text(
                                'Link Aja',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.7,
                                  color: const Color(0xFF1B1C20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      padding: const EdgeInsets.fromLTRB(9, 9, 0, 9),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFECECEC)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF4C3494),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: SizedBox(
                              width: 50,
                              height: 35.7,
                              child: SizedBox(
                                child: Image.network(
                                  'https://rakyatempatlawang.disway.id/upload/09aad3489d0b571af31ff4a67d931051.jpg',
                                  width: 44.7,
                                  height: 11.7,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(8, 7.9, 0, 7.9),
                              child: Text(
                                'Ovo',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.7,
                                  color: const Color(0xFF1B1C20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      padding: const EdgeInsets.fromLTRB(9, 9, 0, 9),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFECECEC)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF0060AF),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: SizedBox(
                              width: 50,
                              height: 35.7,
                              child: SizedBox(
                                width: 40.7,
                                height: 12,
                                child: Image.network(
                                  "https://th.bing.com/th/id/OIP.7dL8MEKiRYUEJFJ_cuAlTQAAAA?rs=1&pid=ImgDetMain",
                                  width: 200.0,
                                  height: 200.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            // Tambahkan Expanded di sini
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(8, 7.9, 0,
                                  7.9), // Ubah margin agar teks mepet ke kiri
                              child: Text(
                                'BCA Virtual Account',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.7,
                                  color: const Color(0xFF1B1C20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      padding: const EdgeInsets.fromLTRB(9, 9, 0, 9),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFECECEC)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Container(
                              width: 50,
                              height: 35.7,
                              padding: const EdgeInsets.fromLTRB(
                                  7.1, 12.1, 7.2, 11.9),
                              child: SizedBox(
                                width: 35.7,
                                height: 11.7,
                                child: Image.network(
                                  'https://i2.wp.com/www.pinclipart.com/picdir/big/341-3413096_bni-bank-negara-indonesia-logo-clipart.png',
                                  width: 200.0,
                                  height: 200.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            // Tambahkan Expanded di sini
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(8, 7.9, 0, 7.9),
                              child: Text(
                                'BNI Virtual Account',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.7,
                                  color: const Color(0xFF1B1C20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16.2, 0, 16.1, 59),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0.1, 0, 0.1, 16),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Summary Order',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF1B1C20),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(0, 0, 0.2, 8.5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: Text(
                                          'Sub Total',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.getFont(
                                            'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 1.7,
                                            color: const Color(0xFF828282),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Rp. 75.000',
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        height: 1.7,
                                        color: const Color(0xFF828282),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(0.2, 0, 0, 8.5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: Text(
                                          'Admin Fee',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.getFont(
                                            'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 1.7,
                                            color: const Color(0xFF828282),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Rp. 5.000',
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        height: 1.7,
                                        color: const Color(0xFF828282),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(0.1, 0, 0.1, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: Text(
                                          'Total',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.getFont(
                                            'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Rp. 80.000',
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        height: 1.4,
                                        color: const Color(0xFF000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12.0),
        child: QActionButton(
          label: "Lanjut",
          onPressed: () {
            // Aksi yang dilakukan saat tombol ditekan
            var stepNavigationController = StepNavigationController.instance;
            stepNavigationController.updateIndex(2);
          },
          verticalPadding: 10.0, // Atur padding vertikal
          horizontalPadding: 300.0, // Atur padding horizontal
        ),
      ),
    );
  }
}
