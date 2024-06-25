import 'package:get/get.dart';

class EventKalenderController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
    // Lakukan pembaruan data atau operasi lain yang sesuai
  }

  // Metode lainnya seperti pengambilan acara untuk tanggal tertentu
  List<String> getEventsForDay(DateTime day) {
    // Logika untuk mendapatkan acara berdasarkan tanggal
    return [];
  }
}
