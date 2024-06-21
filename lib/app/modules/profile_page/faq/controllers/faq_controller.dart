import 'package:get/get.dart';

class FaqController extends GetxController {
  var generalFaqs = <Faq>[
    Faq(
      question: 'What Is Kreasi Nusantara?',
      answer:
          'Kreasi Nusantara adalah platform yang memudahkan pengguna untuk belanja produk lokal, membeli tiket acara seni, dan membaca artikel tentang seni dan budaya Indonesia. Tujuan kami adalah mendukung UMKM lokal dan memperkenalkan kekayaan budaya Indonesia kepada lebih banyak orang.',
      isExpanded: false,
    ),
    Faq(
      question: 'Apa saja fitur Kreasi Nusantara?',
      answer:
          'Fitur Kreasi Nusantara meliputi belanja produk lokal, pembelian tiket acara seni, dan membaca artikel tentang seni dan budaya Indonesia.',
      isExpanded: false,
    ),
  ].obs;

  var localProductsFaqs = <Faq>[
    Faq(
      question: 'Bagaimana cara membeli produk lokal di Kreasi Nusantara?',
      answer:
          'Untuk membeli produk lokal, pilih produk yang diinginkan, tambahkan ke keranjang belanja, dan ikuti proses checkout.',
      isExpanded: false,
    ),
    Faq(
      question: 'Apa saja fitur Kreasi Nusantara?',
      answer:
          'Fitur Kreasi Nusantara meliputi belanja produk lokal, pembelian tiket acara seni, dan membaca artikel tentang seni dan budaya Indonesia.',
      isExpanded: false,
    ),
  ].obs;

  var localTicketsFaqs = <Faq>[
    Faq(
      question: 'Bagaimana acara seni?',
      answer:
          'Untuk membeli produk lokal, pilih produk yang diinginkan, tambahkan ke keranjang belanja, dan ikuti proses checkout.',
      isExpanded: false,
    ),
    Faq(
      question:
          'Apakah saya bisa membatalkan atau mengganti tiket yang sudah dibeli?',
      answer:
          'Fitur Kreasi Nusantara meliputi belanja produk lokal, pembelian tiket acara seni, dan membaca artikel tentang seni dan budaya Indonesia.',
      isExpanded: false,
    ),
  ].obs;

  var localCulturesFaqs = <Faq>[
    Faq(
      question: 'Bagaimana cara menemukan artikel tentang seni dan budaya?',
      answer:
          'Fitur Kreasi Nusantara meliputi belanja produk lokal, pembelian tiket acara seni, dan membaca artikel tentang seni dan budaya Indonesia.',
      isExpanded: false,
    ),
  ].obs;

  void toggleGeneralFaq(int index) {
    generalFaqs[index].isExpanded = !generalFaqs[index].isExpanded;
    generalFaqs.refresh(); // Ensure the UI updates
  }

  void toggleLocalProductsFaq(int index) {
    localProductsFaqs[index].isExpanded = !localProductsFaqs[index].isExpanded;
    localProductsFaqs.refresh(); // Ensure the UI updates
  }

  void toggleLocalTicketsFaq(int index) {
    localTicketsFaqs[index].isExpanded = !localTicketsFaqs[index].isExpanded;
    localTicketsFaqs.refresh(); // Ensure the UI updates
  }

  void toggleLocalCulturesFaq(int index) {
    localCulturesFaqs[index].isExpanded = !localCulturesFaqs[index].isExpanded;
    localCulturesFaqs.refresh(); // Ensure the UI updates
  }
}

class Faq {
  String question;
  String answer;
  bool isExpanded;

  Faq({required this.question, required this.answer, this.isExpanded = false});
}
