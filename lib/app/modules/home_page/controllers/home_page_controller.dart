import 'package:get/get.dart';

class HomePageController extends GetxController {
  //TODO: Implement HomePageController

  final count = 0.obs;

  void increment() => count.value++;

  List<Map<String, dynamic>> products = [
    {
      "id": "90a65ced-68f4-4913-90ef-c8a116dbcb91",
      "image":
          "https://res.cloudinary.com/dzijxkdz5/image/upload/v1719164407/kreasinusantara/products/images/rzh487rrnd93dxuts1g0.jpg",
      "name": "Baju Batik",
      "original_price": 900000,
      "discount_percent": 25,
      "discount_price": 675000,
      "average_rating": 0,
      "total_review": 0
    },
    {
      "id": "dd9e8c99-b8cd-4458-8cdd-8a203fc52684",
      "image":
          "https://res.cloudinary.com/dzijxkdz5/image/upload/v1718823643/kreasinusantara/products/images/rindutcgvykxmwgv0exa.png",
      "name": "atik Sumatra2",
      "original_price": 120000,
      "discount_percent": 10,
      "discount_price": 108000,
      "average_rating": 3.25,
      "total_review": 4
    },
    {
      "id": "c8ad8bca-9301-45aa-8ffb-8b1dcd3124b5",
      "image":
          "https://res.cloudinary.com/dzijxkdz5/image/upload/v1718852711/kreasinusantara/products/images/gkaceqgc460zgjausoxd.png",
      "name": "Batik",
      "original_price": 10000000,
      "discount_percent": 10,
      "discount_price": 9000000,
      "average_rating": 0,
      "total_review": 0
    },
    {
      "id": "3fa1a90a-823f-48fc-b43c-c9800250a4eb",
      "image":
          "https://res.cloudinary.com/dzijxkdz5/image/upload/v1719092852/kreasinusantara/products/images/pcsfatrcq56tnehx9z3d.png",
      "name": "Batik Toraja",
      "original_price": 5000000,
      "discount_percent": 25,
      "discount_price": 3750000,
      "average_rating": 0,
      "total_review": 0
    },
    {
      "id": "4d8c3099-8695-43a3-92e8-87dfe0d6d87a",
      "image":
          "https://res.cloudinary.com/dzijxkdz5/image/upload/v1719166590/kreasinusantara/products/images/yanydpk7wxu4dew7tm4o.png",
      "name": "Celana Batik",
      "original_price": 500000,
      "discount_percent": 10,
      "discount_price": 450000,
      "average_rating": 0,
      "total_review": 0
    },
    {
      "id": "c36b40a8-6146-4237-bc75-3abcf796e643",
      "image":
          "https://res.cloudinary.com/dzijxkdz5/image/upload/v1718825829/kreasinusantara/products/images/tovmxg5ul9k9vudhgw07.jpg",
      "name": "Batik Bugis2",
      "original_price": 14000000,
      "discount_percent": 5,
      "discount_price": 13300000,
      "average_rating": 0,
      "total_review": 0
    },
    {
      "id": "77b43d84-acb7-4a1e-81c7-85eec46fd0cb",
      "image":
          "https://res.cloudinary.com/dzijxkdz5/image/upload/v1719086374/kreasinusantara/products/images/p3aqre0jusdv1lgtuigy.jpg",
      "name": "Batik Bandung",
      "original_price": 55000000,
      "discount_percent": 10,
      "discount_price": 49500000,
      "average_rating": 0,
      "total_review": 0
    }
  ];
}
