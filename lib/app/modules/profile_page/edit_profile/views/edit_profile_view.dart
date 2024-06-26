import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/profile_page/edit_profile/controllers/edit_profile_controller.dart';
import 'package:kreasi_nusantara/app/modules/login_page/main_navigation/views/main_navigation_view.dart';
import 'package:kreasi_nusantara/shared/widget/list/detail_view.dart';
// Sesuaikan dengan lokasi MainNavigationView

class EditProfileView extends GetView<EditProfileViewController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileViewController());

    return QDetailView(
        endpoint: "users",
        id: "me",
        itemBuilder: (item) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF980019),
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 215,
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                    decoration: const BoxDecoration(
                      color: Color(0xFF980019),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(28),
                        bottomRight: Radius.circular(28),
                      ),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.grey.shade300,
                          child: const Icon(
                            Icons.person,
                            size: 90,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                            height: 10), // Adjust the height as needed
                        Text(
                          "${item["first_name"]} ${item["last_name"]}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildTextFieldWithLabel(
                          'Nama Depan',
                          'Masukkan Nama Depan Anda',
                          controller.nameController,
                          onChanged: (value) {
                            controller.firstName = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        _buildTextFieldWithLabel(
                          'Nama Belakang',
                          'Masukkan Nama Belakang Anda',
                          controller.phoneNumberController,
                          onChanged: (value) {
                            controller.lastName = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        _buildTextFieldWithLabel(
                          'Bio',
                          'Masukkan Bio',
                          controller.bioController,
                          maxLines: 3,
                          onChanged: (value) {
                            controller.bio = value;
                          },
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.updateProfile();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF980019),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Edit',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildTextFieldWithLabel(
    String labelText,
    String hintText,
    TextEditingController controller, {
    int? maxLines,
    required Function(dynamic) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
          onChanged: (value) {
            onChanged(value);
          },
        ),
      ],
    );
  }
}
