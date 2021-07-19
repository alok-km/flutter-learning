import 'package:android_intent_plus/android_intent.dart';

void launchAndroidIntent() async {
  AndroidIntent intent = AndroidIntent(
      action: "hk.com.hkicl",
      data: "payload"
          ""
      //arguments: {'authAccount': currentUserEmail},
      );
  await intent.launch();
}
