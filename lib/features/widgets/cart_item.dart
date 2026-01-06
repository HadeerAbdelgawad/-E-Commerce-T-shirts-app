import 'package:untitled/models/home_product_model.dart';

class CartItem {
  final AllProducts product;
  int quantity=0;

    CartItem({
      required this.product,
      required this.quantity,
    });
}