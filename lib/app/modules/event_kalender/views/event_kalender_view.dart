import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/event_page/event/controllers/event_page_controller.dart';
import 'package:kreasi_nusantara/app/modules/event_page/event_detail/views/event_detail_view.dart';
import 'package:kreasi_nusantara/constants/constants.dart';
import 'package:kreasi_nusantara/models/event_model/event_dummy/event_dummy.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/event_kalender_controller.dart';

class EventKalenderView extends StatelessWidget {
  const EventKalenderView({super.key});

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Divider(
        color: ColorCollections.primaryColor,
        height: 1,
        thickness: 1,
        indent: 20,
        endIndent: 20,
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, EventDummy items) {
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
                  image: AssetImage(items.photo),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    width: 50.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFBC0C24)),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Text(
                      items.category,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFBC0C24),
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    items.title,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 16.0, color: secondaryTextColor),
                      const SizedBox(width: 2.0),
                      Text(items.location,
                          style: const TextStyle(fontSize: 10.0)),
                      const SizedBox(width: 4.0),
                      Icon(MdiIcons.clockOutline,
                          size: 16.0, color: secondaryTextColor),
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: Text(
                          items.date,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 10.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      Text(
                        items.price,
                        style: const TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
                      ),
                      Text(items.person,
                          style: TextStyle(
                              fontSize: 10.0, color: secondaryTextColor)),
                      const SizedBox(width: 8.0),
                      SizedBox(
                        height: 32,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                          ),
                          onPressed: () => Get.to(const EventDetailView()),
                          child: const Text(
                            "Get Ticket",
                            style: TextStyle(fontSize: 12.0),
                          ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    List<EventDummy> item = EventDummy.eventsDummy();

    final EventPageController pageController = Get.put(EventPageController());
    final EventKalenderController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalender Event'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  Obx(() {
                    return TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 1, 1),
                      focusedDay: controller.selectedDate.value,
                      selectedDayPredicate: (day) =>
                          isSameDay(controller.selectedDate.value, day),
                      calendarFormat: CalendarFormat.month,
                      eventLoader: controller.getEventsForDay,
                      calendarStyle: const CalendarStyle(
                        selectedDecoration: BoxDecoration(
                          color: ColorCollections.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color: ColorCollections.primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      headerStyle: const HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                      ),
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Bulan'
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        controller.updateSelectedDate(selectedDay);
                      },
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildDivider(),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '25 November',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildDivider(),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '26 November',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildDivider(),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '27 November',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildDivider(),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '28 November',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return _buildEventCard(context, item[0]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
