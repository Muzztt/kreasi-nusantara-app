import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/app/modules/product/pilih%20alamat/controllers/alamat_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/tambah%20alamat/views/tambah_alamat_view.dart';
import 'package:kreasi_nusantara/app/modules/product/update%20alamat/views/update_alamat_view.dart';

class ChangeAddress extends GetView<AlamatController> {
  const ChangeAddress({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building ChangeAddress widget...');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pilih Alamat',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Alamat",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: const Color(0xff980019),
                ),
              ),
              const SizedBox(height: 19),
              Obx(() => Column(
                    children: [
                      ...controller.addresses
                          .map((address) => RadioListTile<String>(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${address.name} | ',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: const Color(0xff353535),
                                          ),
                                        ),
                                        Text(
                                          address.phone,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: const Color(0xff5D5F5F),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${address.street}, ${address.city}, ${address.province} ${address.zipCode}',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: const Color(0xff5D5F5F),
                                      ),
                                    ),
                                  ],
                                ),
                                value: address.id,
                                groupValue:
                                    controller.selectedAddress.value?.id,
                                onChanged: (value) {
                                  // Ketika alamat dipilih, update selectedAddress di AlamatController
                                  controller.changeSelectedAddress(address);
                                },
                                secondary: GestureDetector(
                                  onTap: () {
                                    Get.to(() => UpdateAddress())!.then((_) {
                                      controller.fetchAddresses();
                                    });
                                  },
                                  child: Text(
                                    "Ubah",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: const Color(0xff980019),
                                    ),
                                  ),
                                ),
                              )),
                      const SizedBox(height: 19),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const AddAddress())!.then((_) {
                            controller.fetchAddresses();
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add_circle_outline,
                              size: 24.0,
                              color: Color(0xff980019),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Tambah Alamat Baru",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff980019),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildConfirmationButton(),
    );
  }

  Widget _buildConfirmationButton() {
    return Container(
      height: 88,
      width: 430,
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, -3),
          ),
        ],
        color: Colors.white,
      ),
      child: ElevatedButton(
        onPressed: () {
          // Menggunakan selectedAddress.value untuk aksi yang diperlukan
          var selectedId = controller.selectedAddress.value?.id;

          // Perform actions with the selected ID
          print('ID alamat yang dipilih: $selectedId');
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff980019),
          minimumSize: const Size(331, 40),
          padding: const EdgeInsets.all(18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Konfirmasi',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 0.8,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
