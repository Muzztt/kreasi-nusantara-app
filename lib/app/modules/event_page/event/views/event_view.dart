import 'package:kreasi_nusantara/shared/util/type_extension/date_extension.dart';
import 'package:kreasi_nusantara/shared/util/type_extension/dynamic_extension.dart';
import 'package:kreasi_nusantara/shared/util/type_extension/num_extension.dart';
import 'package:kreasi_nusantara/shared/widget/list/list_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/event_page/event/controllers/event_controller.dart';
import 'package:kreasi_nusantara/app/modules/event_page/event/controllers/event_page_controller.dart';
import 'package:kreasi_nusantara/app/modules/event_page/event_detail/views/event_detail_view.dart';
import 'package:kreasi_nusantara/app/modules/product/widgets/category.dart';
import 'package:kreasi_nusantara/models/event_model/event_dummy/event_dummy.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:kreasi_nusantara/shared/widget/form/button/button_2.dart';
import 'package:kreasi_nusantara/shared/widget/form/search_field/search_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EventView extends GetView<EventController> {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    List<EventDummy> item = EventDummy.eventsDummy();
    List<EventDummy> filteredItems = [];

    final EventPageController pageController = Get.put(EventPageController());

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  QSearchField(
                    label: "Search Product",
                    value: null,
                    prefixIcon: Icons.search,
                    suffixIcon: null,
                    onChanged: (value) {},
                    onSubmitted: (value) {},
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  GetBuilder<EventPageController>(
                    builder: (controller) => Category(
                      buttons: controller.buttons,
                      onButtonTap: controller.buttonTap,
                    ),
                  ),
                  QListView(
                    shrinkWrap: true,
                    endpoint: "events",
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
                                    image: NetworkImage(
                                      item["image"] ??
                                          "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                                    ),
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
                                        item["category"],
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
                                      item["name"],
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
                                          item["location"]["building"]
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
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
                                            DateTime.tryParse(item["date"])
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
                                          double.tryParse(
                                                  item["min_price"].toString())
                                              .currency,
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
