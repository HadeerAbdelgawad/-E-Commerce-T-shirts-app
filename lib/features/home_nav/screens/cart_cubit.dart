import 'package:bloc/bloc.dart';
import 'package:untitled/models/home_product_model.dart';

import '../../widgets/cart_item.dart';

class CartCubit extends Cubit<Map<int, CartItem>> {
  CartCubit() : super({});

  void addToCart(AllProducts product) {
    final cart = Map<int, CartItem>.from(state);

    if (cart.containsKey(product.id)) {
      if (product.id == null) return;
      cart[product.id]!.quantity += 1;
    } else {
      cart[product.id!] = CartItem(product:product, quantity:1);
    }

    emit(cart);
  }

  void increase(int productId) {
    final cart = Map<int, CartItem>.from(state);
    if (cart.containsKey(productId)) {
      cart[productId]!.quantity += 1;
      emit(cart);
    }
  }

  void decrease(int productId) {
    final cart = Map<int, CartItem>.from(state);
    if (cart.containsKey(productId)) {
      if (cart[productId]!.quantity > 1) {
        cart[productId]!.quantity -= 1;
      } else {
        cart.remove(productId);
      }
      emit(cart);
    }
  }

  void removeFromCart(int productId) {
    final cart = Map<int, CartItem>.from(state);
    cart.remove(productId);
    emit(cart);
  }


  int get totalItems {
    return state.values.fold(0, (sum, cartItem) => sum + cartItem.quantity);
  }

  double get totalPrice{
    return state.values.fold(0, (sum , cartItem)=>
      sum+((cartItem.product.price ?? 0) * cartItem.quantity));
  }
}
