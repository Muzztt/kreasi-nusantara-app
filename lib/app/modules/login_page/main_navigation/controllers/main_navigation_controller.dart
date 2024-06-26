import 'package:get/get.dart';

class MainNavigationController extends GetxController {
  //TODO: Implement MainNavigationController

  final count = 0.obs;

  void increment() => count.value++;

  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void navigateToProduct() {
    selectedIndex.value = 1;
  }
}
