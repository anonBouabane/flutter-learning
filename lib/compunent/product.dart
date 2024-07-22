import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/proverder/product_provider.dart';
import 'package:shopgood/view/home/detail.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, value, child) {
      return GridView.builder(
          itemCount: value.getallproduct.length,
          shrinkWrap: true,
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 0.8,
              mainAxisSpacing: 0.8),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  DetailScreen(index: index)
                    ));
              },
              child: Card(
                elevation: 5,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              value.getallproduct[index]['image'])),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          value.getallproduct[index]['detail'].toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              '${value.getallproduct[index]['price']}LAK',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
