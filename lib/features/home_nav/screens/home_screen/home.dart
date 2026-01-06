import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/core/resources/snack_bar.dart';
import 'package:untitled/features/home_nav/screens/home_cubit.dart';
import 'package:untitled/features/widgets/home_items.dart';

import '../product_details/product_details.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..getHeadLineData()
      ..getCategories(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeStateFailure) {
              showMySnackBar(
                msg: 'No Products Provided',
                type: AnimatedSnackBarType.error,
                context: context,
              );
            }
            if (state is HomeStateSuccess) {
              print(state.model);
              // showMySnackBar(
              //   msg: 'Products Loaded Successfully',
              //   type: AnimatedSnackBarType.success,
              //   context: context,
              // );
            }
          },
          builder: (context, state) {
            print('Current state: $state');
            if (state is HomeStateLoading) {
              return Center(
                child: Lottie.asset('assets/json/loading_dots_blue.json'),
              );
            }


            if (state is HomeStateSuccess) {
              final cubit = context.read<HomeCubit>();
              final products = state.model;

              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Discover',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color(0xff3669C9),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffE6E6E6)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffE6E6E6)),
                                ),
                                hintText: "Search for clothes...",
                                hintStyle: TextStyle(color: Color(0xffE6E6E6)),
                              ),
                            ),
                          ),
                          
                          SizedBox(width: 10),
                          
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            decoration: BoxDecoration(
                              color: Color(0xff3669C9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.tune, color: Colors.white),
                          ),
                          
                        ],
                      ),
                      
                      SizedBox(height: 16),


                        HorizontalIcons(
                        categories: cubit.categories,
                        selectedIndex: cubit.selectedIndex,
                        onTap: (index) {
                          cubit.changeCategory(index);
                        },
                      ),
                      SizedBox(height: 16),
                      
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails(model: state.model[index])));

                              },
                              child: HomeItems(
                                itemTitle: product.title ?? 'No Title',
                                itemPrice: '\$ ${product.price?.toStringAsFixed(2) ?? '0.00'}',
                                itemImage: product.image ?? '',
                              ),
                            );
                          },
                        ),
                      ),


                    ],
                  ),
                ),
              );
            }

            return Center(
              child: Text('No products available'),
            );
          },
        ),
      ),
    );
  }
}

class HorizontalIcons extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int) onTap;

  const HorizontalIcons({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              margin: EdgeInsets.only(right: 8),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isSelected ? Color(0xff3669C9) : Colors.white,
                border: isSelected
                    ? null
                    : Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
