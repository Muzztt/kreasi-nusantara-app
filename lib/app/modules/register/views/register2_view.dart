import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class Register2View extends GetView<RegisterController> {
  const Register2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 900,
                child: Image.asset(
                  'assets/images/background.png', // replace with your image path
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
          Positioned(
            top: 328,
            left: (MediaQuery.of(context).size.width - 430) / 2,
            child: Container(
              width: 430,
              height: 604,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF0EF), // Opaque background color
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(65.0),
                  topRight: Radius.circular(65.0),
                ),
                border: Border.all(
                  color: Colors.grey, // Set the color of the border
                  width: 2.0, // Set the width of the border
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Lorem ipsum',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 329,
                        height: 56,
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) =>
                              controller.username.value = value,
                          decoration: const InputDecoration(
                            labelText: 'Masukan Username',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                              ),
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 329,
                        height: 56,
                        child: TextField(
                          onChanged: (value) => controller.email.value = value,
                          decoration: const InputDecoration(
                            labelText: 'Masukan email',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                              ),
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 329,
                        height: 56,
                        child: TextField(
                          onChanged: (value) =>
                              controller.password.value = value,
                          decoration: const InputDecoration(
                            labelText: 'Masukan password',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                              ),
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 331,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => Get.find<PageController>().nextPage(
                        duration: 300.milliseconds,
                        curve: Curves.ease,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF980019), // Use the specified color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 10.0),
                      ),
                      child: const Text(
                        'Daftar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
