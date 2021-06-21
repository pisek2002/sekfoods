import 'package:flutter/material.dart';
import 'package:sekfoods/states/authen.dart';
import 'package:sekfoods/states/buyer_service.dart';
import 'package:sekfoods/states/create_account.dart';
import 'package:sekfoods/states/rider_service.dart';
import 'package:sekfoods/states/seller_service.dart';
import 'package:sekfoods/utillity/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  // ignore: prefer_const_constructors
  '/authen': (BuildContext context) => Authen(),
  // ignore: prefer_const_constructors
  '/create_account': (BuildContext context) => CreateAccount(),
  // ignore: prefer_const_constructors
  '/buyer_service': (BuildContext context) => BuyerService(),
  // ignore: prefer_const_constructors
  '/seller_service': (BuildContext context) => SellerService(),
  // ignore: prefer_const_constructors
  '/rider_service': (BuildContext context) => RiderService(),
};

String? initlalRoute;

void main() {
  initlalRoute = MyConstant.routerAuthen;
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      routes: map,
      initialRoute: initlalRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
