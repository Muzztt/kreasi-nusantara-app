import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/app/modules/product/checkout/controllers/checkout_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/pilih%20alamat/models/adress_model.dart';
import 'package:kreasi_nusantara/app/modules/product/update%20alamat/controllers/update_alamat_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/form.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/text.dart';

// ignore: must_be_immutable
class UpdateAddress extends GetView<UpdateAlamatController> {
  CheckoutProductController co = Get.put(CheckoutProductController());

  UpdateAddress({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController provinsiController = TextEditingController();
    TextEditingController kabupatenController = TextEditingController();
    TextEditingController kecamatanController = TextEditingController();
    TextEditingController kodepsController = TextEditingController();
    TextEditingController alamatController = TextEditingController();
    TextEditingController lableController = TextEditingController();
    RxBool isPrimary = false.obs;

    AddressModel? selectedAddress = co.selectedAddress.value;

    // Set initial values based on selectedAddress
    nameController.text = selectedAddress?.name ?? '';
    phoneController.text = selectedAddress?.phone ?? '';
    provinsiController.text = selectedAddress?.province ?? '';
    kabupatenController.text = selectedAddress?.city ?? '';
    alamatController.text = selectedAddress?.street ?? '';
    kodepsController.text = selectedAddress?.zipCode ?? '';
    lableController.text = selectedAddress?.label ?? '';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Perbarui Alamat',
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
                "Kontak",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: const Color(0xff980019)),
              ),
              const SizedBox(
                height: 8,
              ),
              const ReText(text: ("Nama")),
              const SizedBox(
                height: 8,
              ),
              ReTextField(
                controller: nameController,
                hintText: "Nama Lengkap Anda",
              ),
              const SizedBox(
                height: 8,
              ),
              const ReText(text: "Nomor"),
              const SizedBox(
                height: 8,
              ),
              ReTextField(
                controller: phoneController,
                hintText: "Nomor Hp Anda",
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                "Alamat",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: const Color(0xff980019)),
              ),
              const SizedBox(
                height: 8,
              ),
              const ReText(text: "Provinsi"),
              const SizedBox(
                height: 8,
              ),
              ReTextField(
                controller: provinsiController,
                hintText: "Provinsi",
              ),
              const SizedBox(
                height: 8,
              ),
              const ReText(text: "Kabupaten/Kota"),
              const SizedBox(
                height: 8,
              ),
              ReTextField(
                controller: kabupatenController,
                hintText: "Kabupaten/Kota",
              ),
              const SizedBox(
                height: 8,
              ),
              const ReText(text: "Alamat"),
              const SizedBox(
                height: 8,
              ),
              ReTextField(
                controller: alamatController,
                hintText: "Alamat lengkap",
              ),
              const SizedBox(
                height: 8,
              ),
              const ReText(text: "Kode Pos"),
              const SizedBox(
                height: 8,
              ),
              ReTextField(
                controller: kodepsController,
                hintText: "Kode Pos",
              ),
              const SizedBox(
                height: 8,
              ),
              const ReText(text: "Label"),
              const SizedBox(
                height: 8,
              ),
              ReTextField(
                controller: lableController,
                hintText: "rumah, kantor dsb",
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(() {
                return CheckboxListTile(
                  title: Text(
                    "Tandai Sebagai Utama",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: const Color(0xff980019),
                    ),
                  ),
                  value: isPrimary.value,
                  onChanged: (newValue) {
                    isPrimary.value = newValue!;
                  },
                );
              }),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildCo(
        controller,
        nameController,
        phoneController,
        provinsiController,
        kabupatenController,
        kecamatanController,
        kodepsController,
        alamatController,
        lableController,
        isPrimary,
        selectedAddress?.id,
      ),
    );
  }
}

Widget _buildCo(
  UpdateAlamatController controller,
  TextEditingController nameController,
  TextEditingController phoneController,
  TextEditingController provinsiController,
  TextEditingController kabupatenController,
  TextEditingController kecamatanController,
  TextEditingController kodepsController,
  TextEditingController alamatController,
  TextEditingController lableController,
  RxBool isPrimary,
  String? addressId,
) {
  return Container(
    height: 88,
    width: 430,
    padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2), // Shadow color
        spreadRadius: 1, // Spread radius
        blurRadius: 1, // Blur radius
        offset: const Offset(0, -3), // Offset in the y direction
      ),
    ], color: Colors.white),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isEmpty ||
                  phoneController.text.isEmpty ||
                  provinsiController.text.isEmpty ||
                  kabupatenController.text.isEmpty ||
                  // kecamatanController.text.isEmpty ||
                  kodepsController.text.isEmpty ||
                  // lableController.text.isEmpty ||
                  // primaryController.text.isEmpty ||
                  alamatController.text.isEmpty) {
                Get.snackbar('Error', 'Semua kolom harus diisi',
                    backgroundColor: const Color(0xffC00C25),
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white);
                return;
              }
              controller.updateAlamat(
                namaPenerima: nameController.text,
                telepon: phoneController.text,
                alamat: alamatController.text,
                kota: kabupatenController.text,
                provinsi: provinsiController.text,
                kodePos: kodepsController.text,
                label: lableController.text,
                isPrimary: isPrimary.value,
                addressId: addressId ?? '',
              );
              // Clear text fields after submitting
              nameController.clear();
              phoneController.clear();
              provinsiController.clear();
              kabupatenController.clear();
              kodepsController.clear();
              alamatController.clear();
              lableController.clear();
              isPrimary.value = false;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff980019),
              minimumSize: const Size(331, 40),
              padding: const EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Konfirmasi',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 0.8,
                  color: const Color(0xFFffffff),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
