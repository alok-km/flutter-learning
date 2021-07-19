import 'package:android_intent_plus/android_intent.dart';

void launchAndroidIntent(String payload) async {
  AndroidIntent intent = AndroidIntent(
    action: "hk.com.hkicl",
    //data:,
    arguments: {'payload': payload},
  );
  await intent.launch();
}
