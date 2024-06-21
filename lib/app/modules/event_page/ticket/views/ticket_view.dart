import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/event_page/form_page/views/form_page_view.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import 'package:kreasi_nusantara/shared/widget/card_tiket/card_ticket2.dart';
import 'package:kreasi_nusantara/shared/widget/card_tiket/card_tiket.dart';

import '../controllers/ticket_controller.dart';

class TicketView extends GetView<TicketController> {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              CardTicket(
                title: "PRESALE 1 - VVIP RIGHT",
                subtittle: "Pemegang Tiket VVIP Right memasuki gate 2",
                dateTime: "Berakhir 30 May 2024 - 12:00 WIB",
                price: "Rp. 75.000",
                seat: "1",
                image: "assets/images/exclude.png",
              ),
              CardTicket2(
                title: "PRESALE 1 - VVIP RIGHT",
                subtittle: "Pemegang Tiket VVIP Right memasuki gate 2",
                dateTime: "Berakhir 30 May 2024 - 12:00 WIB",
                price: "Rp. 75.000",
                image: "assets/images/card-ticket-soldout.png",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Total',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'IDR 170.000',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            ElevatedButton(
              onPressed: () => Get.offAll(FormPageView()),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
              ),
              child: const Text("Bayar Sekarang"),
            ),
          ],
        ),
      ),
    );
  }
}
