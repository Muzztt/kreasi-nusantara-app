import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kreasi_nusantara/app/modules/product/pilih%20alamat/controllers/alamat_controller.dart';
import 'package:kreasi_nusantara/app/modules/product/pilih%20alamat/models/adress_model.dart';

import 'package:kreasi_nusantara/app/modules/product/widgets/card_product.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/category.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/opsi_pengiriman_card.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/payment.dart';

class CheckoutProductController extends GetxController {
  String authToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU0YzYwZWNkLTgwNWYtNDA3Yi1iYTQ0LWViYWJhNjU4MTk2YSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIwODc3ODcwfQ.RQimRRWa3Tri-DvVCQOe1NXRJ8UkiQxoyh7ddFT6ZPU';

  final AlamatController alamatController = Get.find();
  final selectedAddress = Rx<AddressModel?>(null);
  String? get selectedAddressId => selectedAddress.value?.id;

  // Method untuk mengambil detail alamat berdasarkan ID
  void getAddressById() async {
    String? selectedAddressId = alamatController.selectedAddressId;

    if (selectedAddressId != null) {
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

          // Update selectedAddress in CheckoutProductController
          selectedAddress.value = address;
          update();

          print(
              'Address by ID: ${address.name}, ${address.street}, ${address.city}');
        } else {
          print('Failed to load address: ${response.statusCode}');
        }
      } catch (e) {
        print('Error loading address: $e');
      }
    }
  }

  List<ProductCard> getCheckedItems() {
    return cartItems.where((item) => item.isChecked.value).toList();
  }

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
}
