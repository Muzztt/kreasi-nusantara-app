import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kreasi_nusantara/shared/widget/form/search_field/search_field.dart';
import '../controllers/home_controller.dart';
import 'widgets/product_card.dart';
import 'widgets/section_title.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Good Morning',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFBC0C24),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                  icon: Image.asset('assets/images/notif.png'),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
        body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  const Text(
                    'Hello, Ardi Febrian!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFFBC0C24),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: Container(
                      width: 398,
                      height: 39,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 5),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SectionTitle(title: 'Upcoming Events'),
                  controller.events.isEmpty
                      ? const Center(
                          child: Text('No upcoming events at the moment.'),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.events.length.clamp(0, 4),
                            itemBuilder: (context, index) {
                              final event = controller.events[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: .0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Card(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 2),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            height: 120,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                              ),
                                              child: Image.asset(
                                                'assets/images/endek bali.png',
                                                fit: BoxFit.cover,
                                                width: 130,
                                                height: 97,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xFFBC0C24), // Ubah warna sesuai preferensi Anda
                                                      width:
                                                          2.0, // Ubah lebar sesuai kebutuhan Anda
                                                    ),
                                                  ),
                                                  child: Text(
                                                    event.category,
                                                    style: const TextStyle(
                                                      color: Color(0xFFBC0C24),
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  event.title,
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.end,
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            Icons.location_on,
                                                            size: 14),
                                                        const SizedBox(
                                                            width: 4),
                                                        Text(
                                                          event.location,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 10,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(width: 0.1),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            Icons.access_time,
                                                            size: 10),
                                                        const SizedBox(
                                                            width: 4),
                                                        Text(
                                                          event.date,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 10,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      event.price,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10,
                                                      ),
                                                      textAlign: TextAlign.end,
                                                    ),
                                                    const SizedBox(
                                                        width:
                                                            10), // Add some space between price and button
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 16,
                                                                vertical: 8),
                                                        minimumSize:
                                                            const Size(80, 0),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          side:
                                                              const BorderSide(
                                                            color: Color(
                                                                0xFFBC0C24),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                            const Color(
                                                                0xFFBC0C24),
                                                      ),
                                                      child: const Text(
                                                        'Get Ticket',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                  const SizedBox(height: 10),
                  SectionTitle(title: 'Local Product'),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 240,
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.products.length.clamp(0, 2),
                        itemBuilder: (context, index) {
                          return ProductCard(
                              product: controller.products[index]);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
