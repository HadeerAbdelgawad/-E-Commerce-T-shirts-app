import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/home_nav/screens/cart_cubit.dart';

import 'package:untitled/features/widgets/cart_item.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        actionsPadding: EdgeInsets.all(10),
        backgroundColor: Colors.white,
        leading: SizedBox.shrink(),
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),

        centerTitle: true,
      ),

      body: BlocBuilder<CartCubit,  Map<int, CartItem>>(
        builder: (context, cartItems) {

          final cartCubit=context.read<CartCubit>();
          final totalItems= cartCubit.totalItems;
          final totalPrice= cartCubit.totalPrice;
          
          if(cartItems.isEmpty){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey),
                  SizedBox(height: 16,),
                  Text( 'Your cart is empty',
                    style: TextStyle(fontSize: 18, color: Colors.grey),)
                ],
              ),
            );
          }

          

          return Column(
            children: [
              Expanded(
                  child:ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: cartItems.length,
                      itemBuilder:(context,index){

                        
                        final cartEntry = cartItems.entries.toList()[index];
                        final product = cartEntry.value.product;
                        final quantity = cartEntry.value.quantity;
                        final productId = cartEntry.key;


                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(width: 1, color: Color(0xffE6E6E6),)
                              ),

                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.network(product.image??'',
                                          width: 80,
                                          height: 79,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context,error, stackType){
                                            return Container(
                                              // width: 80,
                                              // height: 80,
                                              color: Colors.grey[300],
                                              child: Icon(Icons.image),
                                            );
                                          },),

                                        Expanded(
                                          child: ListTile(
                                            title: Text(product.title??'',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14
                                              ),
                                              maxLines: 2
                                              ,),

                                          trailing: GestureDetector(
                                              onTap: () {
                                                context.read<CartCubit>().removeFromCart(productId);
                                              },
                                              child: Icon(Icons.delete_outline_sharp, color: Color(0xffED1010),)),


                                            subtitle: Text('\$${product.price?.toString() ?? ''}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14
                                            ),),

                                            leading: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,

                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    context.read<CartCubit>().decrease(productId);
                                                  },
                                                  child: CircleAvatar(
                                                    radius: 10,
                                                    backgroundColor: Color(0xffFFFFFF),
                                                    child: Icon(Icons.remove, color: Color(0xff6D3805),size: 16,),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                                  child: Text("$quantity",
                                                      style: TextStyle(fontSize: 18 ,
                                                          fontWeight: FontWeight.w400,
                                                          color:Color(0xff804F1E)
                                                      )),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    context.read<CartCubit>().increase(productId);
                                                  },
                                                  child: CircleAvatar(
                                                    radius: 10,
                                                    backgroundColor: Color(0xffFFFFFF),
                                                    child: Icon(Icons.add, color: Color(0xff6D3805),size: 16,),
                                                  ),
                                                ),
                                              ],
                                            ),




                                          ),
                                        ),


                                      ],
                                    ),
                                  ),



                                ],


                              ),
                            ),

                          );
                      }
                  )
              ),

              Container(
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Sub-total",style: TextStyle(color: Color(0xff808080), fontSize: 17, fontWeight: FontWeight.w600),),
                      trailing:Text('\$${totalPrice.toString() ?? ''}',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500) ),
                    ),

                    ListTile(
                      title: Text("VAT (%)",style: TextStyle(color: Color(0xff808080), fontSize: 17, fontWeight: FontWeight.w600),),
                      trailing:Text(r'$ 0.00' ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                    ),

                    ListTile(
                      title: Text("Shipping fee",style: TextStyle(color: Color(0xff808080),fontSize: 17, fontWeight: FontWeight.w600),),
                      trailing:Text(r'$ 80'  ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(color: Color(0xffE6E6E6)),
                    ),

                    ListTile(
                      title: Text("Total",style: TextStyle(color:Colors.black, fontSize: 17, fontWeight: FontWeight.w600),),
                      trailing:Text('\$${totalPrice.toString()} ',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    ),

                  ],
                ),
              ),
            ],
          );

        },
      ),
      
    );
  }
}

