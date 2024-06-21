import 'package:get/get.dart';

import 'package:kreasi_nusantara/app/modules/product/widgets/card_product.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/size.dart';

class DetailProductController extends GetxController {
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
