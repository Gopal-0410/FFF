import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      var data = jsonDecode(response.body);
      var Status = data['STATUS'];
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setBool('STATUS', Status);
      return data;
    } else {
      throw Exception('Failed To load Api');
    }
  }
}
