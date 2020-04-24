import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin countdown on Model {
  static int _remaining = 0;
  static DateTime _dateTime = DateTime.now();

  int get remaining => _remaining;

  void setCountdown(int seconds) {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    if (seconds == 0) {
      _remaining = 0;
      //prefs.remove("countdown");
    } else {
      DateTime start = DateTime.now();
      _dateTime = start.add(Duration(seconds: seconds));
      print('$_dateTime');
      //await prefs.setString("countdown", _dateTime.toString());
    }
  }

  int getCountdown() {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //String value = await prefs.get('countdown');
    //_remaining = value == null ? 0 : DateTime.parse(value).difference(DateTime.now()).inSeconds;
    int seconds = _dateTime.difference(DateTime.now()).inSeconds;
    _remaining = seconds > 0 ? seconds : 0;
    return _remaining;
  }
}
