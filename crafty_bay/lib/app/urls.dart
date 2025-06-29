class Urls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static const String loginUrl = '$_baseUrl/auth/login';

  static const String homeSliderUrl = '$_baseUrl/slides';
  static String categoryListUrl(int count, int currentPage) =>
      '$_baseUrl/categories?count=$count&page=$currentPage';
}
