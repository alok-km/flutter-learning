import 'package:get/get.dart';

class PaymentRecordsX extends GetxController {
  var dropDownValue = "".obs;

  void setSelected(String value) {
    dropDownValue.value = value;
  }
}
