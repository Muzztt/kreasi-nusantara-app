import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kreasi_nusantara/app/modules/product/cart/models/cart_model.dart';

class CartController extends GetxController {
  String authToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU0YzYwZWNkLTgwNWYtNDA3Yi1iYTQ0LWViYWJhNjU4MTk2YSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIwODc3ODcwfQ.RQimRRWa3Tri-DvVCQOe1NXRJ8UkiQxoyh7ddFT6ZPU';

  var cartItems = <CartItem>[].obs;
  var totalPrice = 0.obs;

  @override
  void onInit() {
    fetchCartItems();
    super.onInit();
  }

  void fetchCartItems() async {
    try {
      var url = Uri.parse('https://kreasinusantara.shop/api/v1/carts');
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;
        var productsList = (jsonData['data']['products'] as List)
            .map((item) => CartItem.fromJson(item))
            .toList();
        cartItems.assignAll(productsList);
        totalPrice.value = jsonData['data']['total'];
        update(); // Memanggil update untuk memperbarui tampilan
      } else {
        print('Failed to load cart items: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading cart items: $e');
    }
  }

  @override
  void onReady() {
    reloadCartItems();
    super.onReady();
  }

  void reloadCartItems() {
    fetchCartItems();
  }

  void toggleCheckbox(CartItem cartItem) {
    cartItem.isChecked.value = !cartItem.isChecked.value;
    update(); // Update widget jika diperlukan
  }

  void toggleAllCheckboxes(bool isChecked) {
    for (var cartItem in cartItems) {
      cartItem.isChecked.value = isChecked;
    }
    update(); // Update widget jika diperlukan
  }

  bool areAllChecked() {
    if (cartItems.isEmpty) return false;
    return cartItems.every((cartItem) => cartItem.isChecked.value);
  }

  void increment(CartItem cartItem) {
    cartItem.quantity.value++;
    update(); // Update widget jika diperlukan
  }

  void decrement(CartItem cartItem) {
    if (cartItem.quantity.value > 0) {
      cartItem.quantity.value--;
      update(); // Update widget jika diperlukan
    }
  }

  Future<void> addToCart(String productVariantId, int quantity) async {
    try {
      var url = Uri.parse('https://kreasinusantara.shop/api/v1/carts/items');
      var body = json.encode({
        'product_variant_id': productVariantId,
        'quantity': quantity,
      });

      var response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: body,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        fetchCartItems(); // Ambil ulang item keranjang setelah berhasil menambahkan
        Get.snackbar(
          'Success',
          'Produk berhasil ditambahkan ke keranjang',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Gagal menambahkan produk ke keranjang',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print('Failed to add product to cart: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat menambahkan produk ke keranjang',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print('Error adding product to cart: $e');
    }
  }

  Future<void> updateCartItemQuantity(String cartItemId, int quantity) async {
    try {
      var url =
          Uri.parse('https://kreasinusantara.shop/api/v1/carts/$cartItemId');
      var body = json.encode({
        'quantity': quantity,
      });

      var response = await http.put(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: body,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        fetchCartItems(); // Ambil ulang item keranjang setelah berhasil memperbarui
        print("cart item id $cartItemId  quantity $quantity");
      } else {
        Get.snackbar(
          'Error',
          'Gagal memperbarui kuantitas item',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print('Failed to update item quantity: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat memperbarui kuantitas item',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print('Error updating item quantity: $e');
    }
  }

  Future<void> removeCartItem(String cartItemId) async {
    try {
      var url =
          Uri.parse('https://kreasinusantara.shop/api/v1/carts/$cartItemId');

      var response = await http.delete(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        fetchCartItems(); // Ambil ulang item keranjang setelah berhasil dihapus
        Get.snackbar(
          'Success',
          'Produk berhasil dihapus dari keranjang',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Gagal menghapus produk dari keranjang',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print('Failed to remove product from cart: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat menghapus produk dari keranjang',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print('Error removing product from cart: $e');
    }
  }

  String? getSelectedCartId() {
    // Cari `cartId` dari `CartItem` yang dipilih
    var selectedCartItem =
        cartItems.firstWhereOrNull((cartItem) => cartItem.isChecked.value);
    return selectedCartItem?.cartId;
  }

  Future<String?> makeStaticTransaction(String id) async {
    try {
      var url =
          Uri.parse('https://kreasinusantara.shop/api/v1/product-transactions');
      var body = json.encode({
        'cart_id': id,
      });

      var response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: body,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var responseData = json.decode(response.body) as Map<String, dynamic>;
        var snapUrl = responseData['data']['transaction']['snap_url'];
        return snapUrl; // Return the snap_url directly
      } else {
        // Failed to make transaction
        print('Failed to make transaction: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Error during process
      print('Error making transaction: $e');
      return null;
    }
  }
}
