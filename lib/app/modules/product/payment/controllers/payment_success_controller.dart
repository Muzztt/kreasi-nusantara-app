import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:kreasi_nusantara/app/modules/product/widgets/card_product.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/category.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/opsi_pengiriman_card.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/payment.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/size.dart';

class PaymentSuccessController extends GetxController {
  // final List<ProductCard> products = [
  //   ProductCard(
  //     imageUrl: "https://www.gubukbaju.com/uploads/atasan_kupu_kupu1_tb.jpg",
  //     productName: "Endek Bali",
  //     originalPrice: "300000",
  //     discountPercentage: "40",
  //     discountedPrice: "200000",
  //     rating: "4.9",
  //     totalReviews: 451,
  //     quantity: 0,
  //   ),
  //   ProductCard(
  //     imageUrl:
  //         "https://cdn1-production-images-kly.akamaized.net/80t7gUkD0qRDYQFDiFjc4L8ZQXI=/640x360/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4226062/original/015474800_1668420778-2021_0226_15092000.jpg",
  //     productName: "Batik Tulis",
  //     originalPrice: "500000",
  //     discountPercentage: "30",
  //     discountedPrice: "350000",
  //     rating: "4.8",
  //     totalReviews: 234,
  //     quantity: 0,
  //   ),
  //   ProductCard(
  //     imageUrl: "https://www.gubukbaju.com/uploads/atasan_kupu_kupu1_tb.jpg",
  //     productName: "Endek Bali",
  //     originalPrice: "300000",
  //     discountPercentage: "40",
  //     discountedPrice: "200000",
  //     rating: "4.9",
  //     totalReviews: 451,
  //     quantity: 0,
  //   ),
  //   ProductCard(
  //     imageUrl:
  //         "https://cdn1-production-images-kly.akamaized.net/80t7gUkD0qRDYQFDiFjc4L8ZQXI=/640x360/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4226062/original/015474800_1668420778-2021_0226_15092000.jpg",
  //     productName: "Batik Tulis",
  //     originalPrice: "500000",
  //     discountPercentage: "30",
  //     discountedPrice: "350000",
  //     rating: "4.8",
  //     totalReviews: 234,
  //     quantity: 0,
  //   ),
  //   ProductCard(
  //     imageUrl: "https://www.gubukbaju.com/uploads/atasan_kupu_kupu1_tb.jpg",
  //     productName: "Endek Bali",
  //     originalPrice: "300000",
  //     discountPercentage: "40",
  //     discountedPrice: "200000",
  //     rating: "4.9",
  //     totalReviews: 451,
  //     quantity: 0,
  //   ),
  //   ProductCard(
  //     imageUrl:
  //         "https://cdn1-production-images-kly.akamaized.net/80t7gUkD0qRDYQFDiFjc4L8ZQXI=/640x360/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4226062/original/015474800_1668420778-2021_0226_15092000.jpg",
  //     productName: "Batik Tulis",
  //     originalPrice: "500000",
  //     discountPercentage: "30",
  //     discountedPrice: "350000",
  //     rating: "4.8",
  //     totalReviews: 234,
  //     quantity: 0,
  //   ),
  //   ProductCard(
  //     imageUrl: "https://www.gubukbaju.com/uploads/atasan_kupu_kupu1_tb.jpg",
  //     productName: "Endek Bali",
  //     originalPrice: "300000",
  //     discountPercentage: "40",
  //     discountedPrice: "200000",
  //     rating: "4.9",
  //     totalReviews: 451,
  //     quantity: 0,
  //   ),
  //   ProductCard(
  //     imageUrl:
  //         "https://cdn1-production-images-kly.akamaized.net/80t7gUkD0qRDYQFDiFjc4L8ZQXI=/640x360/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4226062/original/015474800_1668420778-2021_0226_15092000.jpg",
  //     productName: "Batik Tulis",
  //     originalPrice: "500000",
  //     discountPercentage: "30",
  //     discountedPrice: "350000",
  //     rating: "4.8",
  //     totalReviews: 234,
  //     quantity: 0,
  //   ),
  //   // Add more products as needed
  // ];

  final List<Paymentwidget> payment = [
    const Paymentwidget(
      paymentImage:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/LinkAja.svg/2048px-LinkAja.svg.png",
      paymentName: "BCA",
    ),
    const Paymentwidget(
      paymentImage:
          "https://www.upulsa.com/images/produk/ewallet/ovo-1000-214-fqjj.jpg",
      paymentName: "OVO",
    ),
    const Paymentwidget(
      paymentImage:
          "https://cdn3.iconfinder.com/data/icons/banks-in-indonesia-logo-badge/100/BCA-512.png",
      paymentName: "BCA Virtual Account",
    ),
    const Paymentwidget(
      paymentImage:
          "https://cdn3.iconfinder.com/data/icons/banks-in-indonesia-logo-badge/100/BNI-512.png",
      paymentName: "BNI Virtual Account",
    ),
  ];

  final List<ShippingOption> shipping = [
    const ShippingOption(
      kurir: "JNE",
      price: "17000",
      estimate: "1-3 Jun",
    ),
    const ShippingOption(
      kurir: "TIKI",
      price: "14000",
      estimate: "1-3 Jun",
    ),
    const ShippingOption(
      kurir: "POS Indonesia",
      price: "13000",
      estimate: "2-3 jun",
    ),
    // Add more shipping options as needed
  ];
  var selectedShipping = Rx<ShippingOption?>(null);

  void selectShipping(ShippingOption shipping) {
    selectedShipping.value = shipping;
  }

  var selectedCourier = ''.obs;
  var selectedPrice = 0.obs;

  void setSelectedCourier(String courier, int price) {
    selectedCourier.value = courier;
    selectedPrice.value = price;
  }

  final List<ButtonData> buttons = [
    ButtonData(label: "Kemeja", isSelected: true),
    ButtonData(label: "Batik", isSelected: false),
    ButtonData(label: "Kerajinan", isSelected: false),
    ButtonData(label: "Lukisan", isSelected: false),
  ];

  void handleButtonTap(int index) {
    for (int i = 0; i < buttons.length; i++) {
      buttons[i].isSelected = i == index;
    }
    update(); // This will update the UI when a button is tapped
  }

  final List<SizeData> size = [
    SizeData(label: "S", isSelected: true),
    SizeData(label: "M", isSelected: false),
    SizeData(label: "L", isSelected: false),
    SizeData(label: "XL", isSelected: false),
    SizeData(label: "XXL", isSelected: false),
    SizeData(label: "XXXL", isSelected: false),
  ];

  void handlsizeTap(int index) {
    for (int i = 0; i < size.length; i++) {
      size[i].isSelected = i == index;
    }
    update(); // This will update the UI when a button is tapped
  }

  var selectedLocation = Rx<LatLng?>(null);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment(ProductCard product) {
    product.quantity++;
    print('Quantity incremented: ${product.quantity}');
    calculateTotalPrice();
    update();
  }

  void decrement(ProductCard product) {
    if (product.quantity > 0) {
      product.quantity--;
      print('Quantity decremented: ${product.quantity}');
      calculateTotalPrice();
      update();
    }
  }

  var cartItems = <ProductCard>[].obs;
  var totalPrice = 0.obs;

  List<ProductCard> getCheckedItems() {
    return cartItems.where((item) => item.isChecked.value).toList();
  }

  void toggleCheckbox(ProductCard product, bool value) {
    product.isChecked.value = value;
    calculateTotalPrice();
    update();
  }

  void calculateTotalPrice() {
    totalPrice.value = cartItems.where((item) => item.isChecked.value).fold(
        0,
        (sum, item) =>
            sum + int.parse(item.discountedPrice) * item.quantity.toInt());
    update();
  }

  bool areAllChecked() {
    return cartItems.every((product) => product.isChecked.value);
  }

  void toggleAllCheckboxes(bool value) {
    for (var product in cartItems) {
      product.isChecked.value = value;
    }
    calculateTotalPrice();
  }

  var isLoading = false.obs;
  void addToCart(ProductCard product) {
    if (cartItems.contains(product)) {
      // Jika produk sudah ada di keranjang, tambahkan ke jumlahnya
      final existingProduct = cartItems.firstWhere((item) => item == product);
      existingProduct.quantity++;
    } else {
      // Jika produk belum ada di keranjang, tambahkan ke keranjang
      product.quantity =
          RxInt(1); // Set jumlah menjadi 1 karena baru ditambahkan
      cartItems.add(product);
    }
    Get.snackbar(
      'Cart',
      'Product added to cart!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void buyNow(ProductCard product) {
    if (cartItems.contains(product)) {
      // Jika produk sudah ada di keranjang, tambahkan ke jumlahnya
      final existingProduct = cartItems.firstWhere((item) => item == product);
      existingProduct.quantity++;
    } else {
      // Jika produk belum ada di keranjang, tambahkan ke keranjang
      product.quantity =
          RxInt(1); // Set jumlah menjadi 1 karena baru ditambahkan
      cartItems.add(product);
    }
    product.isChecked.value = true;
    calculateTotalPrice();
    update();
  }

  void removeFromCart(ProductCard product) {
    cartItems.remove(product);
  }
}
