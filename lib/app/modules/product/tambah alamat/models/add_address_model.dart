class Address {
  final String label;
  final String recipientName;
  final String phone;
  final String address;
  final String city;
  final String province;
  final String postalCode;
  final bool isPrimary;

  Address({
    required this.label,
    required this.recipientName,
    required this.phone,
    required this.address,
    required this.city,
    required this.province,
    required this.postalCode,
    required this.isPrimary,
  });

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'recipient_name': recipientName,
      'phone': phone,
      'address': address,
      'city': city,
      'province': province,
      'postal_code': postalCode,
      'is_primary': isPrimary,
    };
  }
}
