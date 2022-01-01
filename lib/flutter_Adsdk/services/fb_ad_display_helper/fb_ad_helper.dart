import 'package:fff/flutter_Adsdk/services/share_preferences_data_getter.dart';

class FbAdHelper {
  static Future<String> get fbAdUnitId async{
    SharedPreferencesDataGetter pref = SharedPreferencesDataGetter();
    var fbAdUnitId = await pref.getFbBanner1();
    return Future.value(fbAdUnitId);
  }
}