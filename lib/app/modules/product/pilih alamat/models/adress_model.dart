class AddressModel {
  final String id;
  final String label;
  final String name;
  final String phone;
  final String street;
  final String city;
  final String province;
  final String zipCode;
  final bool isPrimary;

  AddressModel({
    required this.id,
    required this.label,
    required this.name,
    required this.phone,
    required this.street,
    required this.city,
    required this.province,
    required this.zipCode,
    required this.isPrimary,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] ?? '',
      label: json['label'] ?? '',
      name: json['recipient_name'] ?? '',
      phone: json['phone'] ?? '',
      street: json['address'] ?? '',
      city: json['city'] ?? '',
      province: json['province'] ?? '',
      zipCode: json['postal_code'] ?? '',
      isPrimary: json['is_primary'] ?? false,
    );
  }
}
