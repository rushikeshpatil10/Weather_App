import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHepler {
  NetworkHepler(this.url);
  final url;
  Future getData() async {
    // final url = Uri.parse();

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);

      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
// 