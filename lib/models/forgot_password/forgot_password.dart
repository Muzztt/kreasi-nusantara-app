class ForgotPassword {
  final String message;

  ForgotPassword({required this.message});

  factory ForgotPassword.fromJson(Map<String, dynamic> json) {
    return ForgotPassword(
      message: json['message'],
    );
  }
}
