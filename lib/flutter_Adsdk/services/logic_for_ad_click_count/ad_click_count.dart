import 'package:shared_preferences/shared_preferences.dart';
import '../share_preferences_data_getter.dart';

class AdClickCount {
  SharedPreferencesDataGetter prefData = SharedPreferencesDataGetter();
  double? serverForwardClickCount;
  double? forwardClickCount;
  String? frwdClickCount;

  Future<bool> adClickDecrease() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var serverFrwdClick = await prefData.getAppMainClickCntSwAd();
    print(
        "=================================== ad click  =========================");
    print(serverFrwdClick);
    serverForwardClickCount = double.parse(serverFrwdClick);
    forwardClickCount = await prefData.appforwardClick();
    if (forwardClickCount! >= 0) {
      forwardClickCount = forwardClickCount! - 1;
      // frwdClickCount = forwardClickCount.toString();
      pref.setDouble('forwardClickCount', forwardClickCount!);
      print(
          "=================================== ad click count  >0 =========================");
      print(forwardClickCount);

      return false;
    } else if (forwardClickCount! < 0) {
      forwardClickCount = serverForwardClickCount!;
      pref.setDouble('forwardClickCount', forwardClickCount!);
      print(
          "=================================== ad click count <0 =========================");
      print(forwardClickCount);

      return true;
    }

    return false;
  }
}