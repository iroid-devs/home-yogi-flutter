import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final String subscription = 'subscription';

  //set data into shared preferences like this
  Future<void> setSubscription(bool subscription) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(this.subscription, subscription);
  }

  //get value from shared preferences
  Future<bool> getSubscription() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(subscription) ?? false;
  }
}
