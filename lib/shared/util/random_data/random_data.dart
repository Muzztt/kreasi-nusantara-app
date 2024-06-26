import 'dart:convert';
import 'dart:math';
import 'package:faker_dart/faker_dart.dart';

class RandomData {
  final _random = Random();

  String randomAvatarUrl() {
    return "https://placehold.co/300x200.png";
  }

  String randomImageUrl() {
    return "https://placehold.co/300x200.png";
  }

  List<String> randomImageUrls() {
    return [
      "https://placehold.co/300x200.png",
      "https://placehold.co/300x200.png",
      "https://placehold.co/300x200.png",
      "https://placehold.co/300x200.png",
      "https://placehold.co/300x200.png",
    ];
  }

  String randomAttachmentUrl() {
    return "https://res.cloudinary.com/dotz74j1p/raw/upload/v1717421288/ttzcoizbbkarlzhxrscd.pdf";
  }

  List<String> randomAttachmentUrls() {
    return [
      "https://res.cloudinary.com/dotz74j1p/raw/upload/v1717421288/ttzcoizbbkarlzhxrscd.pdf",
      "https://res.cloudinary.com/dotz74j1p/image/upload/v1717473851/pccm9lsdx7s06nhy8mht.pdf",
    ];
  }

  String randomPhone() {
    List<String> phonePrefixes = ['081', '082', '083', '085', '086'];
    String prefix = phonePrefixes[_random.nextInt(phonePrefixes.length)];
    String number = _random.nextInt(1000000000).toString().padLeft(9, '0');
    return '$prefix$number';
  }

  String randomName() {
    return Faker.instance.name.fullName();
  }

  String randomFirstName() {
    return Faker.instance.name.firstName();
  }

  String randomLastName() {
    return Faker.instance.name.lastName();
  }

  List<String> products = {
    // Fruits
    "Fuji Apples", "Organic Bananas", "Raspberry Medley", "Seedless Grapes",
    "Hass Avocados", "Juicy Mangoes", "Sweet Strawberries",

    // Vegetables
    "Baby Carrots", "Broccoli Florets", "Spinach Leaves", "Red Bell Peppers",
    "Yellow Onions", "Roma Tomatoes", "Russet Potatoes",

    // Grains
    "Basmati Rice", "Whole Wheat Flour", "Quaker Oats", "Quinoa", "Brown Rice",
    "Couscous", "Polenta",

    // Protein Foods
    "Chicken Breast", "Salmon Fillet", "Ground Beef", "Black Beans", "Tofu",
    "Lentils", "Eggs",

    // Dairy
    "Fresh Milk", "Cheddar Cheese", "Greek Yogurt", "Butter", "Cottage Cheese",
    "Ice Cream", "Sour Cream",

    // ... (Add more products for the remaining categories)
  }.toList();

  int productIndex = 0;
  String randomProductName() {
    if (productIndex == products.length) {
      productIndex = 0;
    }
    var name = products[productIndex];
    productIndex++;
    return name;
  }

  List<String> categories = [
    "Fruits",
    "Vegetables",
    "Grains",
    "Protein Foods",
    "Dairy",
    "Baked Goods",
    "Snacks",
    "Desserts",
    "Beverages",
    "Condiments/Sauces",
    "Soups",
    "Salads",
    "Sandwiches/Wraps",
    "Pasta",
    "Pizza",
    "Seafood",
    "Eggs",
    "Nuts/Seeds",
    "Oils/Fats",
    "Herbs/Spices",
    "Legumes",
    "Candy/Chocolate",
    "Frozen Foods",
    "Canned Goods",
    "Jams/Preserves",
    "Pickles/Olives",
    "Breakfast Foods",
    "International Cuisine",
    "Fast Food",
    "Comfort Food",
    "Street Food",
    "Gourmet Food",
    "Organic Food",
    "Vegan/Vegetarian",
    "Gluten-Free",
    "Kosher",
    "Halal",
    "Baby Food",
    "Pet Food",
    "Health Supplements",
    "Superfoods",
    "Edible Flowers",
    "Mushrooms",
    "Seaweed",
    "Sprouts"
  ];

  int categoryIndex = 0;
  String randomProductCategoryName() {
    if (categoryIndex == categories.length) {
      categoryIndex = 0;
    }
    var name = categories[categoryIndex];
    categoryIndex++;
    return name;
  }

  int? randomIdFrom(String tableName) {
    return null;

    //
  }

  String randomUsername() {
    return (Faker.instance.name.fullName().toLowerCase().replaceAll(" ", "") +
            randomIntBetween(1000, 9999).toString())
        .replaceAll(".", "");
  }

  DateTime randomDate() {
    DateTime startDate = DateTime(1970);
    DateTime endDate = DateTime.now();
    int randomSeconds =
        _random.nextInt(endDate.difference(startDate).inSeconds);
    return startDate.add(Duration(seconds: randomSeconds));
  }

  String randomString(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(_random.nextInt(chars.length))));
  }

  String randomWords() {
    int count = 2;
    List<String> words = [
      'Lorem',
      'ipsum',
      'dolor',
      'sit',
      'amet',
      'consectetur',
      'adipiscing',
      'elit',
      'sed',
      'do',
      'eiusmod',
      'tempor',
      'incididunt',
      'ut',
      'labore',
      'et',
      'dolore',
      'magna',
      'aliqua',
      'Ut',
      'enim',
      'ad',
      'minim',
      'veniam',
      'quis',
      'nostrud',
      'exercitation',
      'ullamco',
      'laboris',
      'nisi',
      'ut',
      'aliquip',
      'ex',
      'ea',
      'commodo',
      'consequat'
    ];
    List<String> randomWords = [];
    for (int i = 0; i < count; i++) {
      randomWords.add(words[_random.nextInt(words.length)]);
    }
    return randomWords.sublist(0, 2).join(" ");
  }

  String randomAddress() {
    List<String> addresses = ['123 Main St', '456 Elm St', '789 Oak St'];
    return addresses[_random.nextInt(addresses.length)];
  }

  int randomInt() {
    var min = 1000;
    var max = 9000;
    return min + _random.nextInt(max - min + 1);
  }

  int randomIntBetween(int min, int max) {
    return min + _random.nextInt(max - min + 1);
  }

  double randomDouble() {
    var min = 1000;
    var max = 9000;
    return double.parse(
        (min + _random.nextDouble() * (max - min)).toStringAsFixed(2));
  }

  double randomDoubleBetween(double min, double max) {
    return double.parse(
        (min + _random.nextDouble() * (max - min)).toStringAsFixed(2));
  }

  bool randomBoolean() {
    return _random.nextBool();
  }

  String randomValueFromList(List<String> list) {
    return list[_random.nextInt(list.length)];
  }

  String firstValueFromList(List<String> list) {
    return list.first;
  }

  String randomPassword() {
    return "123456";
  }

  String randomEmail() {
    List<String> domains = ['mailinator.com'];
    String name = randomName().toLowerCase().replaceAll(" ", ".");
    String domain = randomValueFromList(domains);
    return '$name@$domain';
  }

  String randomDescription() {
    String lorem =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
    var arr = lorem.split(" ");
    arr.shuffle();
    return arr.join(" ");
  }

  Future<int?> randomId(String tableName) async {
    return 1;
  }

  Future<String?> randomIds(String tableName) async {
    return null;
  }
}

var r = RandomData();
