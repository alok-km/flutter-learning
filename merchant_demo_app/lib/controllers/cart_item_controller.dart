import 'package:get/get.dart';

class CartItemController extends GetxController {
  var cartItemCount = [0, 0, 0, 0].obs;
  List<int> prices = [1199, 1999, 799, 2999].obs;
  RxInt total = 0.obs;
  void increment(index) {
    cartItemCount[index]++;
  }

  void decrement(index) {
    if (cartItemCount[index] > 0) {
      cartItemCount[index]--;
    }
  }

  resetTotal() {
    total = 0.obs;
    update();
  }

  recalculateTotal() {
    for (var i = 0; i < cartItemCount.length; i++) {
      total += prices[i] * cartItemCount[i];
      update();
    }
  }
}
