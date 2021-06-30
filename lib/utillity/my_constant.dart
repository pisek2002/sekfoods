import 'package:flutter/material.dart';

class MyConstant {
  // Genernal
  static String appName = 'AllFood Delivery';

  // Router
  static String routerAuthen = '/authen';
  static String routerCreateAccount = '/create_account';
  static String routerBuyerService = '/buyer_service';
  static String routerSellerService = '/seller_service';
  static String routerRiderService = '/rider_service';

  //Images
  static String image1 = 'images/delivery1.png';
  static String image2 = 'images/delivery2.png';
  static String image3 = 'images/delivery3.png';
  static String image4 = 'images/delivery4.png';
  static String avatar = 'images/avatar.png';

  // Color
  // ignore: prefer_const_constructors
  static Color primary = Color(0xfff44336);
  // ignore: prefer_const_constructors
  static Color dark = Color(0xffba000d);
  // ignore: prefer_const_constructors
  static Color light = Color(0xffff7961);

  // Style
  // ignore: prefer_const_constructors
  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        color: dark,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.w700,
      );
  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );

  // button
  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: MyConstant.primary,
        // ignore: prefer_const_constructors
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}
