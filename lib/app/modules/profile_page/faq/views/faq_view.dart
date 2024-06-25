import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/profile_page/ask_bot/views/ask_bot_view.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    final FaqController controller = Get.put(FaqController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'FAQ',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AskBotView()),
                    );
                    // Handle Ask Bot button press
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(90, 44),
                    backgroundColor: const Color(0xFFBA1A1A),
                    padding: EdgeInsets.zero, // Remove top padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment
                        .center, // Centers text horizontally and vertically
                    child: const Text(
                      'Ask Bot',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            12, // Adjusted font size for better readability
                        fontWeight: FontWeight
                            .bold, // Changed to bold for better emphasis
                        height:
                            1.5, // Adjusted line height for better text spacing
                        letterSpacing:
                            0.5, // Adjusted letter spacing for better readability
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildFaqCategory('Umum', controller.generalFaqs,
                        controller.toggleGeneralFaq),
                    const SizedBox(height: 20),
                    buildFaqCategory(
                        'Belanja Produk Lokal',
                        controller.localProductsFaqs,
                        controller.toggleLocalProductsFaq),
                    const SizedBox(height: 20),
                    buildFaqCategory(
                        'Beli Tiket Acara Seni',
                        controller.localTicketsFaqs,
                        controller.toggleLocalTicketsFaq),
                    const SizedBox(height: 20),
                    buildFaqCategory(
                        'Artikel Seni dan Budaya',
                        controller.localCulturesFaqs,
                        controller.toggleLocalCulturesFaq),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFaqCategory(
      String title, RxList<Faq> faqs, Function(int) toggleFunction) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        Obx(() => ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                toggleFunction(index);
              },
              children: faqs.map<ExpansionPanel>((faq) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(
                        faq.question,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  body: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      faq.answer,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  isExpanded: faq.isExpanded,
                );
              }).toList(),
            )),
      ],
    );
  }
}
