import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kreasi_nusantara/app/modules/product/detail_product/models/detail_model.dart';

import 'package:kreasi_nusantara/app/modules/product/widgets/card_product.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/category.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/size.dart';
import 'package:http/http.dart' as http;

class ProductViewController extends GetxController {
  final List<ProductCard> products = <ProductCard>[].obs;
  Rx<DetailedProduct?> detailedProduct = Rx<DetailedProduct?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  String authToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU0YzYwZWNkLTgwNWYtNDA3Yi1iYTQ0LWViYWJhNjU4MTk2YSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIwODc3ODcwfQ.RQimRRWa3Tri-DvVCQOe1NXRJ8UkiQxoyh7ddFT6ZPU';

  void fetchProducts() async {
    try {
      var url = Uri.parse('https://kreasinusantara.shop/api/v1/products');
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;
        var productsList = (jsonData['data'] as List)
            .map((item) => ProductCard.fromJson(item))
            .toList();
        products.assignAll(productsList);
      } else {
        print('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading products: $e');
    }
  }

  TextEditingController searchController = TextEditingController();

  void searchProducts(String keyword) async {
    if (keyword.isEmpty) {
      fetchProducts();
      return;
    }

    try {
      var url = Uri.parse(
          'https://kreasinusantara.shop/api/v1/products/search?limit=5&offset=0&item=$keyword');
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;

        if (jsonData is Map<String, dynamic> && jsonData['data'] is List) {
          var productsList = (jsonData['data'] as List)
              .map((item) => ProductCard.fromJson(item))
              .toList();
          products.assignAll(productsList);

          if (productsList.isEmpty) {}
        } else {
          print('Invalid response format for products search');
        }
      } else {
        print('Failed to search products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error searching products: $e');
    }
  }

  void fetchProductsByCategory(int categoryIndex) async {
    isLoading.value = true;
    errorMessage.value = '';
    products.clear();
    try {
      String category;
      switch (categoryIndex) {
        case 1:
          category = "Kemeja";
          break;
        case 2:
          category = "Batik";
          break;
        case 3:
          category = "Kerajinan";
          break;
        case 4:
          category = "Lukisan";
          break;
        default:
          return;
      }

      var url = Uri.parse(
          'https://kreasinusantara.shop/api/v1/products/category/$categoryIndex');
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;
        var productsList = (jsonData['data'] as List)
            .map((item) => ProductCard.fromJson(item))
            .toList();
        products.assignAll(productsList);

        if (productsList.isEmpty) {
          errorMessage.value = 'Tidak ada produk dengan kategori $category';
        }
      } else {
        errorMessage.value = 'produk dengan kategori $category tidak ada';
      }
    } catch (e) {
      errorMessage.value = 'Kesalahan saat memuat produk: $e';
    } finally {
      isLoading.value = false;
    }
  }

  final List<ButtonData> buttons = [
    ButtonData(label: "Kemeja", isSelected: false),
    ButtonData(label: "Batik", isSelected: false),
    ButtonData(label: "Kerajinan", isSelected: false),
    ButtonData(label: "Lukisan", isSelected: false),
  ];

  void handleButtonTap(int index) {
    for (int i = 0; i < buttons.length; i++) {
      if (i == index) {
        buttons[i].isSelected = !buttons[i].isSelected;
        if (buttons[i].isSelected) {
          fetchProductsByCategory(index + 1);
        } else {
          fetchProducts(); // Fetch all products if no category selected
        }
      } else {
        buttons[i].isSelected = false;
      }
    }
    update(); // Update UI after fetching products
  }

  Future<void> fetchProductById(String productId) async {
    try {
      var url =
          Uri.parse('https://kreasinusantara.shop/api/v1/products/$productId');
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );

      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        if (jsonData is Map<String, dynamic> && jsonData.containsKey('data')) {
          dynamic productData = jsonData['data'];

          // Check if 'latest_review' is present and handle accordingly
          List<LatestReview> latestReviews = [];
          if (productData['latest_review'] != null) {
            latestReviews = (productData['latest_review'] as List)
                .map((reviewJson) => LatestReview.fromJson(reviewJson))
                .toList();
          }

          List<Variant> variants = [];
          if (productData['variants'] != null) {
            variants = (productData['variants'] as List)
                .map((variantJson) => Variant.fromJson(variantJson))
                .toList();
          }

          // Construct DetailedProduct object
          DetailedProduct detailedProductData = DetailedProduct(
            id: productData['id'],
            name: productData['name'],
            description: productData['description'],
            images: List<String>.from(productData['images']),
            videos: List<String>.from(productData['videos']),
            originalPrice: productData['original_price'].toString(),
            discountPrice: productData['discount_price'].toString(),
            discountPercentage: productData['discount_percent'].toString(),
            rating: productData['average_rating'].toString(),
            totalReviews: productData['total_review'],
            latestReview: latestReviews,
            variants: variants,
          );

          // Set detailedProduct.value to the new DetailedProduct object
          detailedProduct.value = detailedProductData;
          print('Detailed Product: ${detailedProduct.value}');
        } else {
          print('Invalid JSON format: $jsonData');
          detailedProduct.value = null;
        }
      } else {
        print('Failed to fetch product: ${response.statusCode}');
        detailedProduct.value = null;
      }
    } catch (e) {
      print('Error fetching product: $e');
      detailedProduct.value = null;
    }
  }

  final List<SizeData> size = [
    SizeData(label: "S", isSelected: true),
    SizeData(label: "M", isSelected: false),
    SizeData(label: "L", isSelected: false),
    SizeData(label: "XL", isSelected: false),
    SizeData(label: "XXL", isSelected: false),
    SizeData(label: "XXXL", isSelected: false),
  ];

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
