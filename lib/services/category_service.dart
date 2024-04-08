import 'package:http/http.dart' as http;
import 'package:UrbanEraFashion/model/category_model.dart';

class Categoryservices {
  static Future<List<Category>> fetchdata() async {
    final url = Uri.parse("http://10.0.2.2:7000/category");
    try {
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var json = response.body;
        return categoryFromJson(json);
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
