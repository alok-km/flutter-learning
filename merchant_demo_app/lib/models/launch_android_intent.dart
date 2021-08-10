import 'package:android_intent_plus/android_intent.dart';

void launchAndroidIntent(String payload) async {
  AndroidIntent intent = AndroidIntent(
    action: "hk.com.hkicl",
    arguments: {'url': payload},
  );
  await intent.launchChooser("Choose a Payment App");
}
