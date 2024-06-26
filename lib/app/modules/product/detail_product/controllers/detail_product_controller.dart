import 'package:get/get.dart';

import 'package:kreasi_nusantara/app/modules/product/widgets/card_product.dart';

class DetailProductController extends GetxController {
  void increment(ProductCard product) {
    product.quantity++;
    print('Quantity incremented: ${product.quantity}');
    update();
  }

  void decrement(ProductCard product) {
    if (product.quantity > 0) {
      product.quantity--;
      print('Quantity decremented: ${product.quantity}');
      update();
    }
  }
}
