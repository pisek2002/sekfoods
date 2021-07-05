import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sekfoods/utillity/my_constant.dart';
import 'package:sekfoods/widgets/show_image.dart';
import 'package:sekfoods/widgets/show_title.dart';

class MyDialog {
  // ignore: prefer_void_to_null
  Future<Null> alertLocationService(BuildContext context,String title,String message ) async {
    showDialog(
      context: context,
      // ignore: prefer_const_constructors
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(
            path: MyConstant.image4,
          ),
          title: ShowTitle(
            title: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(
            title: message,
            textStyle: MyConstant().h3Style(),
          ),
          // ignore: prefer_const_constructors
        ),
        actions: [
          TextButton(
            onPressed: () async {
              //Navigator.pop(context);
              await Geolocator.openLocationSettings();
              exit(0);
            },
            // ignore: prefer_const_constructors
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
