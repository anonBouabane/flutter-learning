import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:provider/provider.dart';
import 'package:shopgood/proverder/authprovider.dart';
import 'package:shopgood/proverder/banner_provider.dart';
import 'package:shopgood/proverder/cart_provider.dart';
import 'package:shopgood/proverder/product_provider.dart';
import 'package:shopgood/router/route.dart';
import 'package:shopgood/proverder/category_provider.dart';
import 'package:shopgood/view/auth/splashScreen.dart';
import 'package:shopgood/compunent/hive_database.dart';
import 'package:shopgood/compunent/message.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();
  await HiveDatabase().hiveDatabase();
  runApp(EasyLocalization(
    supportedLocales: [Locale('en', 'US'), Locale('lo', 'LA')],
    path: 'assets/translations/',
    fallbackLocale: Locale('lo', 'LA'),
    saveLocale: true,
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CateogryProvider()..getAllcategory()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => BannerProvider()..getAllBanner()),
        ChangeNotifierProvider(create: (_) => ProductProvider()..getallProduct()),
        ChangeNotifierProvider(create: (_)=> CartProvider())
      ],
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: const SplashScreen(),
      theme: ThemeData(fontFamily: "notosanlao.ttf"),
      navigatorKey: NavigationService.navigationKey,
      scaffoldMessengerKey: MessageHelper.key,
      onGenerateRoute: RouteAPI.generateRoutes,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
    );
  }
}
