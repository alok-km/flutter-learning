import 'package:android_intent_plus/android_intent.dart';

void launchAndroidIntent(String url) async {
  AndroidIntent intent = AndroidIntent(
    action: "hk.com.hkicl",
    arguments: {'url': url},
  );
  await intent.launchChooser("Choose a Payment App");
}
