import 'package:flutter/material.dart';
import 'package:sekfoods/utillity/my_constant.dart';
import 'package:sekfoods/widgets/show_image.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double size = MediaQuery.of(context).size.width;
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      body: SafeArea(
        // ignore: avoid_unnecessary_containers
        // ignore: sized_box_for_whitespace
        child: Container(
          width: size*0.6,
          child: ShowImage(path: MyConstant.image1),
        ),
      ),
    );
  }
}
