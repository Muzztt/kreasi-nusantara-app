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
                  SizedBox(height: 5),
                  Center(
                    child: Container(
                      width: 398,
                      height: 39,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      ),
                      child: Row(
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
                      ? Center(
                          child: Text('No upcoming events at the moment.'),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
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
                                              borderRadius: BorderRadius.only(
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
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Color(
                                                          0xFFBC0C24), // Ubah warna sesuai preferensi Anda
                                                      width:
                                                          2.0, // Ubah lebar sesuai kebutuhan Anda
                                                    ),
                                                  ),
                                                  child: Text(
                                                    event.category,
                                                    style: TextStyle(
                                                      color: Color(0xFFBC0C24),
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  event.title,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.end,
                                                ),
                                                SizedBox(height: 8),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(Icons.location_on,
                                                            size: 14),
                                                        SizedBox(width: 4),
                                                        Text(
                                                          event.location,
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 10,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 0.1),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.access_time,
                                                            size: 10),
                                                        SizedBox(width: 4),
                                                        Text(
                                                          event.date,
                                                          style: TextStyle(
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
                                                SizedBox(height: 8),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      event.price,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10,
                                                      ),
                                                      textAlign: TextAlign.end,
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            10), // Add some space between price and button
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        'Get Ticket',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 16,
                                                                vertical: 8),
                                                        minimumSize:
                                                            Size(80, 0),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          side: BorderSide(
                                                            color: Color(
                                                                0xFFBC0C24),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                            Color(0xFFBC0C24),
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
                  SizedBox(height: 10),
                  SectionTitle(title: 'Local Product'),
                  SizedBox(height: 10),
                  Container(
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
                  SizedBox(height: 20),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
