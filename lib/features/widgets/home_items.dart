import 'package:flutter/material.dart';

class HomeItems extends StatelessWidget{
  HomeItems ({super.key,
    required this.itemImage,
    required this.itemTitle,
    required this.itemPrice,
    });

  final String itemImage;
  final String itemTitle;
  final String itemPrice;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              itemImage,
              width: double.infinity,
              
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(itemTitle,
          maxLines: 1,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            overflow: TextOverflow.clip,
          ),),
        SizedBox(height: 4),
        Text(itemPrice,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xff808080)
          ),),
      ],
    );


  }
}

