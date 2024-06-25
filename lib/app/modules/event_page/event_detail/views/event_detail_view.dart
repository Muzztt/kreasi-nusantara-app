import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/event_page/description/views/description_view.dart';
import 'package:kreasi_nusantara/app/modules/event_page/ticket/views/ticket_view.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';

import '../controllers/event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  const EventDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () => Get.back(),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ),
        actions: const [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.share_rounded,
              size: 24.0,
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 280.0,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/wayang.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pergelaran Wayang Kulit",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        size: 18.0,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "29 Nov 2024",
                        style: TextStyle(
                            fontSize: 12.0, color: secondaryTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        MdiIcons.clock,
                        size: 18.0,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "18:00 - 22:00 WIB",
                        style: TextStyle(
                            fontSize: 12.0, color: secondaryTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 18.0,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          "Pleany Hall, Jakarta Convention Center, DKi Jakarta",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: secondaryTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const DefaultTabController(
              length: 2, // Jumlah tab
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: "Deskripsi"),
                      Tab(text: "Tiket"),
                    ],
                  ),
                  SizedBox(
                    height: 300, // Atur tinggi konten tab
                    child: TabBarView(
                      children: [
                        DescriptionView(),
                        TicketView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
