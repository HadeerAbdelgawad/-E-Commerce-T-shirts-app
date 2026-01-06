import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/home_nav/screens/cart_cubit.dart';
import 'package:untitled/features/home_nav/screens/cart_screen/cart_screen.dart';
import 'package:untitled/models/home_product_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.model});
  final AllProducts model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(10),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'Details',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),

        centerTitle: true,
        actions: [Icon(Icons.bookmark_border)],
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),

                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        model.image ?? '',
                        height: 300,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 300,
                            color: Colors.grey[300],
                            child: Icon(Icons.image,size: 80),
                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: Colors.grey)],
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 16),

                    Text(
                      model.title ?? '',
                      maxLines: 2,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),

                    SizedBox(height: 8),

                    Row(
                      children: [
                        Icon(Icons.star, color: Color(0xffFFA928)),
                        SizedBox(width: 4),
                        Text(
                          '${model.rating?.rate?.toStringAsFixed(1)??'0.0'}/5',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        SizedBox(width: 8,),
                        Text(
                            '(${model.rating?.count ?? 0} reviews)',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,
                          color: Color(0xff808080)),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    Text(
                      model.description ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff808080),
                      ),
                    ),

                    // Spacer(flex: 1,),
                    //
                    // Divider(color: Colors.grey,),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),


      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, -3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff808080),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${model.price?.toString() ?? ''}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ],
            ),

            SizedBox(width: 16),

            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  context.read<CartCubit>().addToCart(model);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                    content: Text('Added to cart!'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff3669C9),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.card_travel, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
