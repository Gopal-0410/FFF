import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  Future getApiData({
    required String packageName,
    required String hashKey,
    required String appOpenID,
    required String appModel,
  }) async {
    http.Response response = await http.post(Uri.parse(url), body: {
      'PHSUGSG6783019KG': packageName,
      'AFHJNTGDGD563200K': hashKey,
      'DTNHGNH7843DFGHBSA': appOpenID,
      'DBMNBXRY4500991G': appModel,
    });
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      throw Exception('Failed To load Api');
    }
  }
}
