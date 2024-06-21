// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kreasi_nusantara/app/modules/checkout/views/checkout_view.dart';
// import 'package:kreasi_nusantara/app/modules/event/controllers/event_controller.dart';
// import 'package:kreasi_nusantara/app/modules/form_page/views/form_page_view.dart';
// import 'package:kreasi_nusantara/app/modules/status/views/status_view.dart';

// class MultiStepNavigation extends StatefulWidget {
//   final Function(int) onStepTapped;

//   const MultiStepNavigation({super.key, required this.onStepTapped});

//   @override
//   _MultiStepNavigation createState() => _MultiStepNavigation();
// }

// class _MultiStepNavigation extends State<MultiStepNavigation> {

//   final EventController controller = Get.put(EventController());
//   int currentStep = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Checkout'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//       ),
//       body: Stepper(
//         type: StepperType.horizontal,
//         currentStep: currentStep,
//         onStepContinue: () {
//           if (currentStep < getSteps().length - 1) {
//             setState(() => currentStep += 1);
//           }
//         },
//         onStepCancel: () {
//           if (currentStep > 0) {
//             setState(() => currentStep -= 1);
//           }

//   }

//   List<Step> getSteps() {
//     return [
//       Step(
//         isActive: currentStep >= 0,
//         title: const Text('Text'),
//         content: Container(
//           padding: const EdgeInsets.all(8.0),
//           child: const Text('Step 1 content'),
//         ),
//       ),
//       Step(
//         isActive: currentStep >= 1,
//         title: const Text('Address'),
//         content: Container(
//           padding: const EdgeInsets.all(8.0),
//           child: const Text('Step 2 content'),
//         ),
//       ),
//       Step(
//         isActive: currentStep >= 2,
//         title: const Text('Complete'),
//         content: Container(
//           padding: const EdgeInsets.all(8.0),
//           child: const Text('Step 3 content'),
//         ),
//         ),
//       ),
//     )

//       ),
//   }
//     ];
//   }
// }

