const baseUrl = "https://node-server-api-q7vr.onrender.com/api/v1";

class ApiPath {
  static const String login = "${baseUrl}/user/login";
  static const String register = "${baseUrl}/user/register";
  static const String refreshToken = "${baseUrl}/user/refreshToken";
  static const String getallBanner = "${baseUrl}/banner/getAll";
  static const String getallCategory = "${baseUrl}/category/getAll";

  static String getProductAll = "${baseUrl}/product/getAll";
  static String getProductByCategory = "${baseUrl}/product/getByCategory/";
}
