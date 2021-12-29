import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesDataGetter {
  Future getStatus() async {
    bool? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getBool('STATUS');
    return Future.value(status);
  }
}
