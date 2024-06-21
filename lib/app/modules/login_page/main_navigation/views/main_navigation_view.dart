import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/article_page/article/views/article_view.dart';
import 'package:kreasi_nusantara/app/modules/event_page/event/views/event_view.dart';
import 'package:kreasi_nusantara/app/modules/home/views/home_view.dart';
import 'package:kreasi_nusantara/app/modules/product/product_page/views/product_view.dart';
import 'package:kreasi_nusantara/app/modules/profile_page/profile/views/profile_view.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';

import '../controllers/main_navigation_controller.dart';

class MainNavigationView extends GetView<MainNavigationController> {
  const MainNavigationView({super.key});
  @override
  Widget build(BuildContext context) {
    final MainNavigationController controller = Get.find();
    return Scaffold(
      body: Obx(() {
        switch (controller.selectedIndex.value) {
          case 0:
            return const HomeView();
          case 1:
            return const ProductView();
          case 2:
            return const EventView();
          case 3:
            return const ArticleView();
          case 4:
            return const ProfileView();
          default:
            return const MainNavigationView();
        }
      }),
      bottomNavigationBar: SizedBox(
        height: 72,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18.0),
            topRight: Radius.circular(18.0),
          ),
          child: Obx(() => BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                onTap: controller.changeIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                    ),
                    label: 'Product',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.event),
                    label: 'Event',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.article),
                    label: 'Article',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white70,
                backgroundColor: primaryColor,
                type: BottomNavigationBarType.fixed,
              )),
        ),
      ),
    );
  }
}
