import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/action_button.dart';
import 'package:kreasi_nusantara/shared/widget/step_navigation/step_navigation.dart';

import '../controllers/description_controller.dart';

class DescriptionView extends GetView<DescriptionController> {
  const DescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nikmati malam penuh magis dengan keindahan seni tradisional Jawa dalamm acara "Malam Budaya: Pergelaran Wayang Kulit Tradisional". Acara ini akan menampilkan lakon klasik yang dipentaskan oleh dalang ternama, Ki Manteb Sudarsono, bersama dengan iringan gamelan yang menghanyutkan. Wayang Kulit adalah salah satu warisan budaya Indonesia yang diakui oleh UNESCO sebagai karya agung warisan budaya lisan dan nonbendawi manusia. Acara ini bertujuan untuk melestarikan dan memperkenalkan kembali seni tradisional Wayang Kulit kepada masyarakat luas, khususnya generasi muda.',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 8.0),
                Text(
                  'Ayo ajak keluarga dan teman-teman Anda untuk menghadiri malam yang penuh dengan seni, budaya, dan hiburan ini. Mari bersama-sama melestarikan kebudayaan Indonesia melalui Pergelaran Wayang Kulit. Sampai jumpa di Taman Budaya Yogyakarta!',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16.0), // Added space between text and button
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: QActionButton(
          label: "Lihat Tiket",
          onPressed: () {
            // Aksi yang dilakukan saat tombol ditekan
            var stepNavigationController = StepNavigationController.instance;
            stepNavigationController.updateIndex(1);
          },
        ),
      ),
    );
  }
}
