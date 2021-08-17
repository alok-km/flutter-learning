import 'package:get/get.dart';

class ConfigurationController extends GetxController {
  //properties[0] is proxyId
  //properties[1] is proxyIdType
  //properties[2] is endToEndPrefix
  RxList<String> properties = ["", "", ""].obs;
}
