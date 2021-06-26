import 'package:flutter/material.dart';
import 'package:sekfoods/utillity/my_constant.dart';
import 'package:sekfoods/widgets/show_title.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        // ignore: prefer_const_constructors
        title: Text('สมัครสมาชิก'),
      ),

      // ignore: prefer_const_constructors
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
          behavior: HitTestBehavior.opaque,
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              buildData(),
              // ignore: prefer_const_constructors
              buildName(size),
              buildAddress(size),
              buildPhoneNumber(size),
              buildUser(size),
              buildPassword(size),
              buildTitle('เลือกสมัครสมาชิกตามชนิด'),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: prefer_const_constructors
  Widget buildData() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Container(
            // ignore: prefer_const_constructors
            margin: EdgeInsets.symmetric(
              vertical: 16,
            ),
            // ignore: prefer_const_constructors
            child: Text(
              'กรุณาใส่ข้อมูล',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: MyConstant.dark),
            ),
          ),
        ],
      );

  Row buildName(double size) {
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
          width: size * 0.7,
          // ignore: prefer_const_constructors
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style(),
              labelText: 'ชื่อ :',
              // ignore: prefer_const_constructors
              prefixIcon: Icon(
                Icons.face,
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

  Row buildAddress(double size) {
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
          width: size * 0.7,
          // ignore: prefer_const_constructors
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style(),
              labelText: 'ที่อยู่ :',
              // ignore: prefer_const_constructors
              prefixIcon: Icon(
                Icons.home,
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

  Row buildPhoneNumber(double size) {
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
          width: size * 0.7,
          // ignore: prefer_const_constructors
          child: TextFormField(
            keyboardType: TextInputType.phone,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style(),
              labelText: 'เบอร์โทร :',
              // ignore: prefer_const_constructors
              prefixIcon: Icon(
                Icons.phone_android,
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
          width: size * 0.7,
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
          width: size * 0.7,
          // ignore: prefer_const_constructors
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style(),
              labelText: 'Password :',
              // ignore: prefer_const_constructors
              prefixIcon: Icon(
                Icons.lock,
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

  Container buildTitle(String title) {
    // ignore: prefer_const_constructors
    return Container(margin: EdgeInsets.symmetric(vertical: 20,horizontal: 85),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().h2Style(),
      ),
    );
  }
}
