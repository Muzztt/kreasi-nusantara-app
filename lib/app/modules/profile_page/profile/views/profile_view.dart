import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/profile_page/edit_profile/views/edit_profile_view.dart';
import 'package:kreasi_nusantara/app/modules/profile_page/faq/views/faq_view.dart';
import 'package:kreasi_nusantara/app/modules/profile_page/history/views/history_view.dart';
import 'package:kreasi_nusantara/app/modules/profile_page/privacy/views/privacy_view.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 260,
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            decoration: const BoxDecoration(
              color: Color(0xFF980019),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 90,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Mamad Panjaitan',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'my name is Mamad, a UI/UX Designer who love music and traditional culture.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: [
                _buildProfileOption(
                  Icons.edit,
                  'Edit Profil',
                  const EditProfileView(),
                ),
                _buildProfileOption(
                  Icons.history,
                  'History',
                  HistoryView(),
                ),
                _buildTicketsSection(),
                _buildProfileOption(
                  Icons.lock_outline,
                  'Edit privasi',
                  const PrivacyView(),
                ),
                _buildProfileOption(
                  Icons.quiz_outlined,
                  'Frequently asked question',
                  const FaqView(),
                ),
                _buildLogoutOption(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String label, Widget page) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        leading: Icon(
          icon,
          color: Colors.black,
          size: 18,
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        onTap: () {
          Get.to(page);
        },
      ),
    );
  }

  Widget _buildTicketsSection() {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.confirmation_number_outlined,
                color: Colors.black,
                size: 18,
              ),
              title: const Text(
                'Tiket Yang Sedang Berjalan',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              onTap: () {
                controller.toggleTicketSection();
              },
            ),
            Visibility(
              visible: controller.isTicketSectionExpanded,
              child: Container(
                height: 130, // Adjust based on your ticket card height
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTicketCard('assets/images/card-ticket.jpg'),
                      const SizedBox(width: 10),
                      _buildTicketCard('assets/images/card-ticket.jpg'),
                      const SizedBox(width: 10),
                      // Add more ticket cards as needed
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTicketCard(String imagePath) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Container(
        width: 150, // Adjust width to fit your ticket image
        height: 100, // Adjust height to fit your ticket image
        margin: const EdgeInsets.only(right: 10), // Space between ticket cards
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutOption() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        leading: const Icon(
          Icons.logout,
          color: Color(0xFF980019),
          size: 18,
        ),
        title: const Text(
          'Keluar Akun',
          style: TextStyle(
            color: Color(0xFF980019),
            fontSize: 14,
          ),
        ),
        onTap: () {
          // Implement logout logic here
          // Misalnya, kembali ke halaman login atau lakukan clear session
        },
      ),
    );
  }
}
