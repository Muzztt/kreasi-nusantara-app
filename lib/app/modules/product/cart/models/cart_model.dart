import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CartItem {
  final String cartItemId;
  final String cartId;
  final String productVariantId;
  final String productName;
  final String productImage;
  final int originalPrice;
  final int discountPrice;
  final String size;
  final RxInt quantity; // Gunakan RxInt untuk membuat kuantitas observable
  RxBool isChecked;

  CartItem({
    required this.cartItemId,
    required this.cartId,
    required this.productVariantId,
    required this.productName,
    required this.productImage,
    required this.originalPrice,
    required this.discountPrice,
    required this.size,
    required int quantity, // Ubah menjadi int biasa di sini
    bool isChecked = false,
  })  : quantity = RxInt(quantity), // Inisialisasi RxInt dengan nilai kuantitas
        isChecked = RxBool(isChecked);

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      cartItemId: json['cart_item_id'],
      cartId: json['cart_id'],
      productVariantId: json['product_variant_id'],
      productName: json['product_name'],
      productImage: json['product_image'],
      originalPrice: json['original_price'],
      discountPrice: json['discount_price'],
      size: json['size'],
      quantity: json['quantity'], // Ambil nilai kuantitas dari JSON
      isChecked: false,
    );
  }
}
