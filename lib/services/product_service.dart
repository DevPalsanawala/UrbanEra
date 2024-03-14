import 'package:http/http.dart' as http;
import 'package:shoppers_ecommerce_flutter_ui_kit/model/product_model.dart';

class Productservices {
  static Future<List<Products>> fetchdata() async {
    final url = Uri.parse("http://10.0.2.2:7000/product");
    try {
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var json = response.body;

        return productsFromJson(json);
      } else {
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
