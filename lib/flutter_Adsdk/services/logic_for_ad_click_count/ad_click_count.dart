import 'package:shared_preferences/shared_preferences.dart';
import '../share_preferences_data_getter.dart';

class AdClickCount {
  SharedPreferencesDataGetter prefData = SharedPreferencesDataGetter();
  int? staticForwardClickCount;
  int? dynamicForwardClickCount;
  String? dynamicForwardClickCountInString;

  Future<bool> adClickDecrease() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String staticServerFrwdClick = await prefData.getAppMainClickCntSwAd();

    if (staticServerFrwdClick == "0") {
      return true;
    }

    staticForwardClickCount = int.parse(staticServerFrwdClick);
    dynamicForwardClickCount = await prefData.appDynamicForwardClick();

    if (dynamicForwardClickCount! == staticForwardClickCount) {
      dynamicForwardClickCount = dynamicForwardClickCount! - 1;
      dynamicForwardClickCountInString = dynamicForwardClickCount.toString();
      pref.setString(
          'dynamicForwardClickCount', dynamicForwardClickCountInString!);
      return true;
    } else if (dynamicForwardClickCount! <= 0) {
      dynamicForwardClickCount = staticForwardClickCount!;
      String forwardClickInString = dynamicForwardClickCount.toString();
      pref.setString('dynamicForwardClickCount', forwardClickInString);
      return false;
    } else if (dynamicForwardClickCount! < staticForwardClickCount! &&
        dynamicForwardClickCount! > 0) {
      dynamicForwardClickCount = dynamicForwardClickCount! - 1;
      dynamicForwardClickCountInString = dynamicForwardClickCount.toString();
      pref.setString(
          'dynamicForwardClickCount', dynamicForwardClickCountInString!);

      return false;
    }

    return false;
  }
}
