import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/generated/locale_keys.g.dart';
import 'package:shopgood/proverder/authprovider.dart';
import 'package:shopgood/proverder/banner_provider.dart';
import 'package:shopgood/compunent/product.dart';
import 'package:shopgood/proverder/category_provider.dart';
import 'package:shopgood/proverder/product_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> changeLanguage() async {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal == const Locale('en', 'US')) {
      EasyLocalization.of(context)!.setLocale(const Locale('lo', 'LA'));
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final productprovider =
        Provider.of<ProductProvider>(context, listen: false);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          title: Text(
            LocaleKeys.home.tr(),
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  changeLanguage();
                },
                icon: Icon(
                  Icons.language,
                  size: 30,
                  color: Colors.white,
                )),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  auth.exitApp();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          hintText: "search...",
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.apps,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Consumer<BannerProvider>(builder: (context, bannerProvider, child) {
              if (bannerProvider.isloading == true) {
                return Center(child: CircularProgressIndicator());
              }
              if (bannerProvider.banners.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return CarouselSlider(
                options: CarouselOptions(
                    height: 140,
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayAnimationDuration: Duration(milliseconds: 100)),
                items: bannerProvider.banners.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Image.network(i.image.toString(),
                            fit: BoxFit.cover),
                      );
                    },
                  );
                }).toList(),
              );
            }),
            Consumer<CateogryProvider>(
              builder: (context, value, child) {
                return SizedBox(
                  height: 50,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.category.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            value.changeCategory(index);
                            productprovider.getdataByID(
                                categoryID:
                                    value.category[index].id.toString());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: value.currenIndex == index
                                    ? Colors.amber
                                    : const Color.fromARGB(255, 12, 125, 182)),
                            width: 100,
                            height: 50,
                            margin: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              value.category[index].title.toString(),
                              style: const TextStyle(color: Colors.white),
                            )),
                          ),
                        );
                      }),
                );
              },
            ),
            Row(
              children: [
                Text(
                  LocaleKeys.product.tr(),
                  style:
                      TextStyle(color: Colors.deepPurpleAccent, fontSize: 26),
                ),
                Spacer(),
                Icon(Icons.ac_unit),
              ],
            ),
            const ProductScreen()
          ],
        )),
      ),
    );
  }

  List<String> model = [
    "assets/images/picture.png",
    "assets/images/picture01.png",
    "assets/images/picture02.png"
  ];

  int curRentIndex = 0;

  ontap(index) {
    setState(() {
      curRentIndex = index;
    });
  }
}
