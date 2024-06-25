// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StepNavigation extends StatefulWidget {
  final List<String> navigations;
  final List<Widget> children;
  final int initialIndex;
  const StepNavigation({
    super.key,
    required this.navigations,
    required this.children,
    this.initialIndex = 0,
  });

  @override
  State<StepNavigation> createState() => StepNavigationController();
}

class StepNavigationController extends State<StepNavigation> {
  static late StepNavigationController instance;
  int selectedIndex = 0;
  List<bool> clickedSteps = []; // Tambahkan daftar untuk menyimpan status klik

  updateIndex(int newIndex) {
    if (!clickedSteps[newIndex]) {
      clickedSteps[newIndex] = true; // Tandai langkah sebagai diklik
    }
    selectedIndex = newIndex;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
    instance = this;
    clickedSteps = List<bool>.filled(widget.navigations.length,
        false); // Inisialisasi semua langkah sebagai belum diklik
    clickedSteps[selectedIndex] = true; // Tandai langkah awal sebagai diklik
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (selectedIndex > 0) {
                    setState(() {
                      selectedIndex--; // Kurangi indeks untuk kembali ke langkah sebelumnya
                    });
                  } else {
                    Navigator.pop(
                        context); // Kembali ke layar sebelumnya jika tidak ada langkah sebelumnya dalam langkah navigasi
                  }
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 18.0,
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 38.0,
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: List.generate(widget.navigations.length, (index) {
                      var navigationName = widget.navigations[index];
                      bool selected = selectedIndex == index;
                      return Row(
                        children: [
                          if (!selected)
                            InkWell(
                              onTap: () => updateIndex(index),
                              child: CircleAvatar(
                                backgroundColor: clickedSteps[index]
                                    ? primaryColor
                                    : primaryColor, // Ubah warna ke merah jika sudah diklik
                                radius: 12,
                                child: Icon(
                                  clickedSteps[index]
                                      ? MdiIcons.check
                                      : null, // Ubah ikon menjadi ceklis jika sudah diklik
                                  size: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          if (selected) ...[
                            CircleAvatar(
                              radius: 12,
                              backgroundColor:
                                  primaryColor, // Ubah warna ke merah
                              child: CircleAvatar(
                                radius: 11,
                                backgroundColor: Colors.white,
                                child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          const SizedBox(width: 6.0),
                          Text(
                            navigationName,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: selected
                                  ? Colors.black
                                  : Colors
                                      .grey, // Warna teks hitam jika dipilih, abu-abu jika tidak
                            ),
                          ),
                          if (index < widget.navigations.length - 1)
                            Container(
                              height: 2,
                              width: 32, // Tambahkan garis pemisah
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              decoration: BoxDecoration(
                                color: primaryColor, // Garis berwarna merah
                              ),
                            ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: widget.children,
            ),
          ),
        ],
      ),
    );
  }
}
