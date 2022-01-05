import 'dart:developer';

import 'package:fff/flutter_Adsdk/services/share_preferences_data_getter.dart';

class FbAdHelper {
   Future<String> get fbAdUnitId async{
    SharedPreferencesDataGetter pref = SharedPreferencesDataGetter();
    var fbAdUnitId = await pref.getFbBanner1();
    log('Fb Ad Id $fbAdUnitId');
    return Future.value(fbAdUnitId);
  }
}