import 'dart:convert';

import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/product/detail_product/models/detail_model.dart';
import 'package:kreasi_nusantara/app/modules/product/pilih%20alamat/models/adress_model.dart';
import 'package:http/http.dart' as http;

import 'package:kreasi_nusantara/app/modules/product/widgets/card_product.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/category.dart';

import '../widgets/opsi_pengiriman_card.dart';
import '../widgets/payment.dart';
import '../widgets/size.dart';

class ProductController extends GetxController {
  String authToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU0YzYwZWNkLTgwNWYtNDA3Yi1iYTQ0LWViYWJhNjU4MTk2YSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIwODc3ODcwfQ.RQimRRWa3Tri-DvVCQOe1NXRJ8UkiQxoyh7ddFT6ZPU';
  Rx<AddressModel?> selectedAddress = Rx<AddressModel?>(null);

//tambahkan get address by id
  void getAddressById(String selectedAddressId) async {
    try {
      var url = Uri.parse(
          'https://kreasinusantara.shop/api/v1/users/me/addresses/$selectedAddressId');
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;
        var address = AddressModel.fromJson(jsonData['data']);

        // Simpan alamat ke dalam state GetX
        selectedAddress.value = address;

        print(
            'Address by ID: ${address.name}, ${address.street}, ${address.city}');
      } else {
        print('Failed to load address: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading address: $e');
    }
  }

  Rx<Paymentwidget?> selectedPayment = Rx<Paymentwidget?>(null);

  void selectPayment(Paymentwidget payment) {
    selectedPayment.value = payment;
    update();
  }

  List<Paymentwidget> payment = [];

  ProductController() {
    payment = [
      Paymentwidget(
        paymentImage:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/LinkAja.svg/2048px-LinkAja.svg.png",
        paymentName: "LinkAja",
        onTap: () {
          selectPayment(payment[0]);
        },
      ),
      Paymentwidget(
        paymentImage:
            "https://www.upulsa.com/images/produk/ewallet/ovo-1000-214-fqjj.jpg",
        paymentName: "OVO",
        onTap: () {
          selectPayment(payment[1]);
        },
      ),
      Paymentwidget(
        paymentImage:
            "https://cdn3.iconfinder.com/data/icons/banks-in-indonesia-logo-badge/100/BCA-512.png",
        paymentName: "BCA Virtual Account",
        onTap: () {
          selectPayment(payment[2]);
        },
      ),
      Paymentwidget(
        paymentImage:
            "https://cdn3.iconfinder.com/data/icons/banks-in-indonesia-logo-badge/100/BNI-512.png",
        paymentName: "BNI Virtual Account",
        onTap: () {
          selectPayment(payment[3]);
        },
      ),
    ];
  }
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

  var sizes = <SizeData>[].obs;
  var selectedSize = ''.obs;
  var selectedStock = 0.obs;
  var selectedVariantId = ''.obs;
  var isLoading = false.obs;

  // Add the variants property
  List<Variant> variants = [];

  void fetchSizes(List<Variant> variants) {
    this.variants = variants; // Store variants for later use
    sizes.clear();
    for (var variant in variants) {
      sizes.add(SizeData(label: variant.size, isSelected: false));
    }
    sizes.refresh();
  }

  void handlsizeTap(int index) {
    for (int i = 0; i < sizes.length; i++) {
      if (i == index) {
        sizes[i].toggleSelection();
        if (sizes[i].isSelected) {
          selectedSize.value = sizes[i].label;
          selectedStock.value = variants[i].stock;
          selectedVariantId.value = variants[i].id;
          print('Selected Variant ID: ${variants[i].id}');
        } else {
          selectedSize.value = '';
          selectedStock.value = 0;
          selectedVariantId.value = '';
        }
      } else {
        sizes[i].isSelected = false;
      }
    }
    sizes.refresh();
    update();
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
