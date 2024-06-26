import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/event_kalender/views/event_kalender_view.dart';
import 'package:kreasi_nusantara/app/modules/event_page/event_detail/views/event_detail_view.dart';
import 'package:kreasi_nusantara/models/event_model/event_dummy/event_dummy.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:kreasi_nusantara/shared/util/type_extension/date_extension.dart';
import 'package:kreasi_nusantara/shared/util/type_extension/num_extension.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/button_2.dart';
import 'package:kreasi_nusantara/shared/widget/form/search_field/search_field.dart';
import 'package:kreasi_nusantara/shared/widget/list/list_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});
  @override
  Widget build(BuildContext context) {
    List<EventDummy> item = EventDummy.eventsDummy();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat Pagi",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "Halo, Bessotu!",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Get.to(const EventKalenderView()),
                      icon: Icon(
                        Icons.calendar_month,
                        color: primaryColor,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14.0,
                ),
                QSearchField(
                  label: "Search",
                  value: null,
                  prefixIcon: Icons.search,
                  suffixIcon: null,
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Text(
                      "Rekomendasi Event",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: secondaryTextColor,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Lihat Semua",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                QListView(
                  endpoint: "events/upcoming",
                  shrinkWrap: true,
                  emptyBuilder: () {
                    return Container(
                      height: 160.0,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        color: Colors.grey[200],
                      ),
                      child: const Center(
                        child: Text(
                          "No event",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                  itemBuilder: (item, index) {
                    return Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(item["image"] ??
                                      "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6.0),
                                    margin: const EdgeInsets.all(8.0),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          12.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 1.0,
                                    ),
                                    width: 50.0, // Ukuran lebar container
                                    height: 20.0, // Ukuran tinggi container
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // Warna latar belakang putih
                                      border: Border.all(
                                        color:
                                            primaryColor, // Warna border merah
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          6.0), // Radius border kotak
                                    ),
                                    child: Text(
                                      item["category"] ?? "-",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Text(
                                    item["name"] ?? "-",
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 16.0,
                                        color: secondaryTextColor,
                                      ),
                                      const SizedBox(
                                        width: 2.0,
                                      ),
                                      Text(
                                        item["location"].toString(),
                                        style: const TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Icon(
                                        MdiIcons.clockOutline,
                                        size: 16.0,
                                        color: secondaryTextColor,
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Expanded(
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          DateTime.tryParse(
                                                      item["date"].toString())
                                                  ?.edMMMy ??
                                              "-",
                                          style: const TextStyle(
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        double.tryParse(item["minimum_price"]
                                                    .toString())
                                                ?.currency ??
                                            "-",
                                        style: const TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "items.person",
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: secondaryTextColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      QButton2(
                                        label: "Beli Tiket",
                                        height: 32,
                                        width: 92,
                                        onPressed: () =>
                                            Get.to(const EventDetailView()),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      "Rekomendasi Produk",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: secondaryTextColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Lihat Semua",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18.0,
                ),
                GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.0 / 1.4,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.products[index];
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    item["image"] ??
                                        "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045560/mq2o8cqtmvaobrnil7xi.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    6.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            item["name"] ?? "-",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "IDR ${item["original_price"]}",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: secondaryTextColor,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                "${item["discount_percent"]}%",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            "IDR ${item["discount_price"]}",
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
