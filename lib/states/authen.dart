import 'package:flutter/material.dart';
import 'package:sekfoods/utillity/my_constant.dart';
import 'package:sekfoods/widgets/show_image.dart';
import 'package:sekfoods/widgets/show_title.dart';

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
        child: ListView(
          children: [
            buildImage(size),
            buildAppName(),
          ],
        ),
      ),
    );
  }

  Row buildAppName() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTitle(
                title: MyConstant.appName,
                textStyle: MyConstant().h1Style(),
              ),
            ],
          );
  }

  Row buildImage(double size) {
    // ignore: sized_box_for_whitespace
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          width: size * 0.75,
          child: ShowImage(path: MyConstant.image1),
        ),
      ],
    );
  }
}
