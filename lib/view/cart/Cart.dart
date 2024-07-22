import 'package:flutter/material.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({super.key});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          'cart',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Card(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                        'assets/images/download (3).jpeg',
                                        fit: BoxFit.cover,
                                      )),
                                  Column(
                                    children: [
                                     Row(children: [ IconButton(
                                          onPressed: () {
                                            onadd();
                                          },
                                          icon: Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.blue,
                                          )),
                                      Text(
                                        'ຈຳນວນ : ${amount}',
                                        style: TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            onremove();
                                          },
                                          icon: Icon(
                                            Icons.remove_circle_outline,
                                            color: Colors.blue,
                                          )),],),
                                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ລາຄາ  120.000 LAK',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 22),
                                      ),
                                      Text(
                                        'ລວມ ${price * amount}  LAK',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 22),
                                      )
                                    ],
                                  ),
                                    ],
                                  ),
                                  
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: Colors.amber,
        child: GestureDetector(
            onTap: () {
              print('object');
            },
            child: Icon(
              Icons.wallet,
              size: 70,
            )),
      ),
    );
  }

  int amount = 1;

  onadd() {
    setState(() {
      amount++;
    });
  }

  int price = 120000;

  onremove() {
    if (amount == 1) {
      return;
    }
    setState(() {
      amount--;
    });
  }
}
