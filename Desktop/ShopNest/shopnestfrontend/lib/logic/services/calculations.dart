import '../../data/models/cart/cart_item_model.dart';

class Calculations {

  static double cartTotal(List<CartItemModel> items) {
    double total = 0;

    for(int i=0; i<items.length; i++) {
      total += items[i].product!.price! * items[i].quantity!;
    }

    return total;
  }

}

// class Calculations {
//
//  static double cartTotal(List<CartItemModel> items) {
//   double total = 0;
//
//   items.forEach((item) {
//    total += (item.product!.price ?? 0) * (item.quantity ?? 0);
//   });
//
//   return total;
//  }
//
//}