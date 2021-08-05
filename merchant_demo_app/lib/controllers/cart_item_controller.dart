import 'package:get/get.dart';

class CartItemController extends GetxController {
  var cartItemCount = [0, 0, 0, 0].obs;
  List<double> prices = [
    double.parse(11.99.toStringAsFixed(2)),
    double.parse(19.90.toStringAsFixed(2)),
    double.parse(7.49.toStringAsFixed(2)),
    double.parse(22.50.toStringAsFixed(2))
  ];
  RxList<double> total = [double.parse(0.00.toStringAsFixed(2))].obs;

  void increment(index) {
    cartItemCount[index]++;
  }

  void decrement(index) {
    if (cartItemCount[index] > 0) {
      cartItemCount[index]--;
    }
  }
}
