import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/category.dart';

class EventPageController extends GetxController {
  final List<ButtonData> buttons = [
    ButtonData(label: "All", isSelected: true),
    ButtonData(label: "Music", isSelected: false),
    ButtonData(label: "Wayang", isSelected: false),
    ButtonData(label: "Teater", isSelected: false),
  ];

  void buttonTap(int index) {
    for (int i = 0; i < buttons.length; i++) {
      buttons[i].isSelected = i == index;
    }
    update(); // This will update the UI when a button is tapped
  }
}
