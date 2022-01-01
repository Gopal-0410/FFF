import 'package:shared_preferences/shared_preferences.dart';
import '../share_preferences_data_getter.dart';

class AdClickCount {
  SharedPreferencesDataGetter prefData = SharedPreferencesDataGetter();
  int? serverForwardClickCount;
  int? forwardClickCount;
  String? frwdClickCount;

  Future<bool> adClickDecrease() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var serverFrwdClick = await prefData.getAppMainClickCntSwAd();
    print(
        "===================================Server ad click  =========================");
    print("serverFrwdClick :- $serverFrwdClick");

    serverForwardClickCount = int.parse(serverFrwdClick);

    print("serverForwardClickCount in double : - $serverForwardClickCount");

    forwardClickCount = await prefData.appforwardClick();

    print("forwardClickCount :- $forwardClickCount");
    if (forwardClickCount! >= 0) {
      print(
          "=================================== here enter in do not show ad condition =================");
      forwardClickCount = forwardClickCount! - 1;
      // frwdClickCount = forwardClickCount.toString();

      print("app dynamic value :- $forwardClickCount");
      String forwardClickInString = forwardClickCount.toString();
      print("value in string: $forwardClickInString");
      pref.setString('xyz', forwardClickInString);
      int val = await prefData.appforwardClick();
      print("new stored value :- $val");

      print(" id ad show :-  false");

      return false;
    } else if (forwardClickCount! < 0) {
      print(
          "=================================== here enter in ad show condition =================");
      forwardClickCount = serverForwardClickCount!;
      print("app dynamic value :- $forwardClickCount");
      String forwardClickInString = forwardClickCount.toString();
      print("value in string: $forwardClickInString");
      pref.setString('forwardClickCount', forwardClickInString);
      print(" id ad show :-  true");
      return true;
    }

    return false;
  }
}
