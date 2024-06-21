import 'package:get/get.dart';
import '../controllers/review_controller.dart';

class ReviewBinding extends Bindings {
  final String productId;

  ReviewBinding(this.productId);

  @override
  void dependencies() {
    print('Binding ReviewController for Product ID: $productId');
    Get.lazyPut<ReviewController>(
      () => ReviewController(productId: productId),
    );
  }
}
