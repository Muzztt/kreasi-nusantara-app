class Transaction {
  final String id;
  final String cartId;
  final String userId;
  final int totalAmount;
  final String transactionStatus;
  final String snapUrl;

  Transaction({
    required this.id,
    required this.cartId,
    required this.userId,
    required this.totalAmount,
    required this.transactionStatus,
    required this.snapUrl,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      cartId: json['cart_id'],
      userId: json['user_id'],
      totalAmount: json['total_amount'],
      transactionStatus: json['transaction_status'],
      snapUrl: json['snap_url'],
    );
  }
}
