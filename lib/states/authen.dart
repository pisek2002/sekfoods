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
  bool ststusRedEye = true;

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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
          behavior: HitTestBehavior.opaque,
          child: ListView(
            children: [
              buildImage(size),
              buildAppName(),
              buildUser(size),
              buildPassword(size),
              buildLogin(size),
            ],
          ),
        ),
      ),
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // ignore: prefer_const_constructors
          margin: EdgeInsets.symmetric(
            vertical: 16,
          ),
          width: size * 0.6,
          child: ElevatedButton(
            style: MyConstant().myButtonStyle(),
            onPressed: () {},
            // ignore: prefer_const_constructors
            child: Text('Login'),
          ),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: sized_box_for_whitespace
        // ignore: prefer_const_constructors
        Container(
          // ignore: prefer_const_constructors
          margin: EdgeInsets.only(
            top: 16,
          ),
          width: size * 0.6,
          // ignore: prefer_const_constructors
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style(),
              labelText: 'User :',
              // ignore: prefer_const_constructors
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: MyConstant.dark,
              ),
              // ignore: prefer_const_constructors
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyConstant.dark,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              // ignore: prefer_const_constructors
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyConstant.light,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: sized_box_for_whitespace
        // ignore: prefer_const_constructors
        Container(
          // ignore: prefer_const_constructors
          margin: EdgeInsets.only(
            top: 16,
          ),
          width: size * 0.6,
          // ignore: prefer_const_constructors
          child: TextFormField(
            obscureText: ststusRedEye,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    ststusRedEye = !ststusRedEye;
                  });
                  // ignore: prefer_const_constructors
                },
                icon: ststusRedEye
                    ? Icon(
                        Icons.remove_red_eye,
                        color: MyConstant.dark,
                      )
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: MyConstant.dark,
                      ),
              ),
              labelStyle: MyConstant().h3Style(),
              labelText: 'Password :',
              // ignore: prefer_const_constructors
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: MyConstant.dark,
              ),
              // ignore: prefer_const_constructors
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyConstant.dark,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              // ignore: prefer_const_constructors
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: MyConstant.light,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
          width: size * 0.6,
          child: ShowImage(path: MyConstant.image1),
        ),
      ],
    );
  }
}
