import 'package:flutter/material.dart';
import 'package:shopgood/view/cart/Cart.dart';

class DetailItemScreen extends StatelessWidget {
  final String image;
  const DetailItemScreen({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          Image.network(
            image.toString(),
            height: 300,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            top: 35,
            left: 10,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 20,
                  )),
            ),
          ),
          Positioned(
            top: 35,
            right: 10,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: IconButton(
                  onPressed: () { 
                    Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CartDetail()));
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 35,
                  )),
            ),
          ),
        ],
      );
    
  }
}
