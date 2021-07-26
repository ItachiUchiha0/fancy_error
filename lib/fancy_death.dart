import 'package:fancy_death/ErrorScreen.dart';
import 'package:flutter/cupertino.dart';

class FancyDeath {
  ///
  /// this method is for getting Custom death screen
  static ErrorScreen fancyDeath(FlutterErrorDetails details) {
    return ErrorScreen(details);
  }
}
