import 'package:get/get.dart';
import '../models/event_model.dart';
import '../models/product_model.dart';
// Adjust the import paths as needed

class HomeController extends GetxController {
  var events = <Event>[].obs;
  var products = <Product>[].obs;

  @override
  void onInit() {
    fetchEvents();
    fetchProducts();
    super.onInit();
  }

  void fetchEvents() {
    var eventResult = [
      Event(
          title: 'Traditional Fest Music',
          category: 'Music',
          location: 'Ubud, Bali',
          date: '28 Nov 2024 - 07:00PM',
          price: 'IDR 20.000/person',
          imageUrl: 'assets/music_event.jpg',
          button: 'Get Ticket'),
      Event(
          title: 'Barong and Keris Dance',
          category: 'Dance',
          location: 'Ubud, Bali',
          date: '28 Nov 2024 - 07:00PM',
          price: 'IDR 100.000/person',
          imageUrl: 'assets/dance_event.jpg',
          button: 'Get Ticket'),
    ];
    events.assignAll(eventResult);
  }

  void fetchProducts() {
    var productResult = [
      Product(
        title: 'Endek Bali',
        oldPrice: 'IDR 200.000',
        newPrice: 'IDR 120.000',
        discount: '40%',
        imageUrl: 'assets/images/endek bali.png',
        rating: 4.8,
        reviews: 455,
      ),
      Product(
        title: 'Batik Tibodunyo',
        oldPrice: 'IDR 320.000',
        newPrice: 'IDR 250.000',
        discount: '40%',
        imageUrl: 'assets/images/batik tibodunyo.png',
        rating: 4.9,
        reviews: 451,
      ),
    ];

    this.products.assignAll(productResult);
  }
}
