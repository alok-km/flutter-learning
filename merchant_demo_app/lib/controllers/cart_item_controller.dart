import 'package:get/get.dart';

class CartItemController extends GetxController {
  var cartItemCount = [0, 0, 0, 0].obs;
  List<int> prices = [1199, 1999, 799, 2999];
  void increment(index) {
    cartItemCount[index]++;
  }

  void decrement(index) {
    if (cartItemCount[index] > 0) {
      cartItemCount[index]--;
    }
  }

  var totalPrice = 0;
  int total() {
    for (var i = 0; i < cartItemCount.length; i++) {
      totalPrice += prices[i] * cartItemCount[i];
    }
    return totalPrice;
  }
}
