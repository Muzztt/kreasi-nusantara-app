import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kreasi_nusantara/app/modules/product/pilih%20alamat/models/adress_model.dart';

class AlamatController extends GetxController {
  var selectedOption = "Option 1".obs;
  var addresses = <AddressModel>[].obs;
  var selectedAddress = Rx<AddressModel?>(null);

  String? get selectedAddressId => selectedAddress.value?.id;

  @override
  void onInit() {
    super.onInit();
    fetchAddresses();
  }

  String authToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImU0YzYwZWNkLTgwNWYtNDA3Yi1iYTQ0LWViYWJhNjU4MTk2YSIsInJvbGUiOiJ1c2VyIiwiZXhwIjoxNzIwODc3ODcwfQ.RQimRRWa3Tri-DvVCQOe1NXRJ8UkiQxoyh7ddFT6ZPU';

  void fetchAddresses() async {
    try {
      var url =
          Uri.parse('https://kreasinusantara.shop/api/v1/users/me/addresses');
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );
      print('Fetching addresses...');

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>?;

        if (jsonData != null && jsonData['data'] != null) {
          var addressesList = (jsonData['data'] as List)
              .map((item) => AddressModel.fromJson(item))
              .toList();
          addresses.assignAll(addressesList);

          // Print addresses to console
          for (var address in addressesList) {
            print(
                'Address: ${address.name}, ${address.street}, ${address.city}');
          }

          print('Addresses assigned: ${addresses.length}');
        } else {
          print('No data received');
        }
      } else {
        print('Failed to load addresses: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading addresses: $e');
    }
  }

  void changeSelectedAddress(AddressModel newAddress) {
    selectedAddress.value = newAddress;
  }

  void addAddress(AddressModel newAddress) {
    addresses.add(newAddress);
  }

  void changeSelectedOption(String newOption) {
    selectedOption.value = newOption;
  }
}
