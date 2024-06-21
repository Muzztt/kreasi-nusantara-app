import 'package:get/get.dart';

class HistoryController extends GetxController {
  List<Map<String, dynamic>> products = [];
  List<Map<String, dynamic>> tickets = [];

  @override
  void onInit() {
    super.onInit();
    // Panggil method untuk menginisialisasi atau memuat produk dan tiket
    fetchProducts();

    fetchTickets();
  }

  void fetchProducts() {
    // Misalnya, inisialisasi produk dari data dummy
    products = [
      {
        'image': 'assets/images/batik tibodunyo.png',
        'title': 'Batik Tibudunyo',
        'color': 'Hitam',
        'size': 'S',
        'price': 199000,
      },
      {
        'image': 'assets/images/endek bali.png',
        'title': 'Batik Endek Bali',
        'color': 'Hitam',
        'size': 'L',
        'price': 299000,
      },
    ];
    update(); // Memberi tahu GetX untuk memperbarui widget yang mendengarkan controller ini
  }

  void fetchTickets() {
    // Misalnya, inisialisasi tiket dari data dummy
    tickets = [
      {
        'image': 'assets/images/festival.png',
        'event': 'Pergelaran Wayang Kulit Tradisonal Indonesia',
        'seat': 'VIP LEFT',
        'amount': '2x',
        'type': 'REGULER',
        'quantity': '1x',
        'price': 500000,
      },
      {
        'image': 'assets/images/festival.png',
        'event': 'Festival Music XXII',
        'seat': 'VVIP LEFT',
        'amount': '2x',
        'type': 'REGULER',
        'quantity': '2x',
        'price': 300000,
      },
    ];
    update(); // Memberi tahu GetX untuk memperbarui widget yang mendengarkan controller ini
  }
}
