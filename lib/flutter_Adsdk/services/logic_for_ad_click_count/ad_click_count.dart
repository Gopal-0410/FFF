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
        "===================================End in the Global call =========================");

    if (dynamicForwardClickCount! == staticForwardClickCount) {
      print(
          "=================================== here Start enter in ad show condition =================");

      dynamicForwardClickCount = dynamicForwardClickCount! - 1;
      dynamicForwardClickCountInString = dynamicForwardClickCount.toString();
      pref.setString(
          'dynamicForwardClickCount', dynamicForwardClickCountInString!);
      pref.reload();
      print("staticForwardCLick count:- $staticForwardClickCount");
      print("value in  dynamic variable: $dynamicForwardClickCountInString");

      print(
          "=================================== here end enter in ad show condition =================");
      print(" id ad show :-  true");
      return true;
    } else if (dynamicForwardClickCount! < staticForwardClickCount!) {
      print(
          "=================================== here Startdo not show ad condition =================");
      if (dynamicForwardClickCount! < staticForwardClickCount!) {
        pref.reload();
        dynamicForwardClickCount = dynamicForwardClickCount! - 1;
        dynamicForwardClickCountInString = dynamicForwardClickCount.toString();
        pref.setString(
            'dynamicForwardClickCount', dynamicForwardClickCountInString!);
        pref.reload();
        print("staticForwardCLick count:- $staticForwardClickCount");
        print("value in dynamic variable: $dynamicForwardClickCountInString");

        if (dynamicForwardClickCount! < 0) {
          print(
              "============================= here enter in <0 condition ========================");

          pref.reload();
          dynamicForwardClickCount = staticForwardClickCount!;
          print("app dynamic variable :- $dynamicForwardClickCount");
          String forwardClickInString = dynamicForwardClickCount.toString();
          print("staticForwardCLick count:- $staticForwardClickCount");
          print("value in dynamic variable: $forwardClickInString");
          pref.setString('forwardClickCount', forwardClickInString);
          print(" id ad show :-  false");
          pref.reload();
          print(
              "============================= here end in <0 condition ========================");
          return true;
        }
        print(
            "=================================== here End in do not show ad condition =================");
      }

      return false;
    }
    print("==============================globale method end call");
    return false;
  }
}
