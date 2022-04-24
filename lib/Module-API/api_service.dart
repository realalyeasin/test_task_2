import 'package:http/http.dart' as http;
import '../Module-Product/Models/product_model.dart';

class ApiService{
  static var client = http.Client();

  static Future<Product?> fetchProducts() async {
    var response = await client.get(Uri.parse('https://foodbukka.herokuapp.com/api/v1/restaurant'));
    print(response.body);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    }
  }
}