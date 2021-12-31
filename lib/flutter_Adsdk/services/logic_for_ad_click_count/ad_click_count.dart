import 'package:shared_preferences/shared_preferences.dart';
import '../share_preferences_data_getter.dart';

class AdClickCount {
  SharedPreferences pref = SharedPreferences.getInstance() as SharedPreferences;
  SharedPreferencesDataGetter prefData = SharedPreferencesDataGetter();
}
