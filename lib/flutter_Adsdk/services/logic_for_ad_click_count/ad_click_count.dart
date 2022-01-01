import 'package:shared_preferences/shared_preferences.dart';
import '../share_preferences_data_getter.dart';

class AdClickCount {
  SharedPreferencesDataGetter prefData = SharedPreferencesDataGetter();
  int? staticForwardClickCount;
  int? dynamicForwardClickCount;
  String? dynamicForwardClickCountInString;

  Future<bool> adClickDecrease() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var staticServerFrwdClick = await prefData.getAppMainClickCntSwAd();
    print("==============================globale method start call");

    staticForwardClickCount = int.parse(staticServerFrwdClick);

    dynamicForwardClickCount = await prefData.appDynamicForwardClick();

    print("staticForwardCLick count:- $staticForwardClickCount");
    print("dynamicForwarClickCount :- $dynamicForwardClickCount");
    print(
        "===================================End printing =========================");

    if (dynamicForwardClickCount! == staticForwardClickCount) {
      print(
          "=================================== here Start ad show condition =================");

      dynamicForwardClickCount = dynamicForwardClickCount! - 1;
      dynamicForwardClickCountInString = dynamicForwardClickCount.toString();
      pref.setString(
          'dynamicForwardClickCount', dynamicForwardClickCountInString!);

      print("staticForwardCLick count:- $staticForwardClickCount");
      print("value in  dynamic variable: $dynamicForwardClickCountInString");
      print(" id ad show :-  true");
      print(
          "=================================== here end ad show condition =================");

      return true;
    } else if (dynamicForwardClickCount! <= 0) {
      print(
          "============================= here Start in < 0 condition ========================");

      dynamicForwardClickCount = staticForwardClickCount!;
      //  print("app dynamic variable :- $dynamicForwardClickCount");
      String forwardClickInString = dynamicForwardClickCount.toString();
      print("staticForwardCLick count:- $staticForwardClickCount");
      //  print("value in dynamic variable before set: $forwardClickInString");

      pref.setString('dynamicForwardClickCount', forwardClickInString);
      //  pref.reload();
      var val = pref.getString('dynamicForwardClickCount');
      print("value in dynamic variable after set: $val");
      print(" id ad show :-  false");

      print(
          "============================= here end in < 0 condition ========================");
      return false;
    } else if (dynamicForwardClickCount! < staticForwardClickCount! &&
        dynamicForwardClickCount! > 0) {
      print(
          "=================================== here Start do not show ad condition =================");

      dynamicForwardClickCount = dynamicForwardClickCount! - 1;
      dynamicForwardClickCountInString = dynamicForwardClickCount.toString();
      // print(
      //     "value in dynamic variable before set: $dynamicForwardClickCountInString");
      pref.setString(
          'dynamicForwardClickCount', dynamicForwardClickCountInString!);

      print("staticForwardCLick count:- $staticForwardClickCount");
      print(
          "value in dynamic variable after set: $dynamicForwardClickCountInString");
      print(" id ad show :-  false");
      print(
          "=================================== here End in do not show ad condition =================");

      return false;
    }
    print("==============================globale method end call");
    return false;
  }
}
