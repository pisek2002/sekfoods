import 'package:flutter/material.dart';
import 'package:sekfoods/utillity/my_constant.dart';
import 'package:sekfoods/widgets/show_image.dart';
import 'package:sekfoods/widgets/show_title.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? typeUser;
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
      body: GestureDetector(
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
            buildRadioBuyer(size),
            buildRadioSeller(size),
            buildRadioRider(size),
            buildTitle('รูปภาพ'),
            //buildSubTitle(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: prefer_const_constructors
                Container(margin: EdgeInsets.symmetric(vertical: 28,horizontal: 10,),
                  child: IconButton(
                    onPressed: () {},
                    // ignore: prefer_const_constructors
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 36,
                      color: MyConstant.dark,
                    ),
                  ),
                ),
                // ignore: sized_box_for_whitespace
                // ignore: prefer_const_constructors
                Container(
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  width: size * 0.6,
                  child: ShowImage(path: MyConstant.avatar),
                ),
                // ignore: prefer_const_constructors
                Container(margin: EdgeInsets.symmetric(vertical: 28,horizontal: 10,),
                  child: IconButton(
                    onPressed: () {},
                    // ignore: prefer_const_constructors
                    icon: Icon(
                      Icons.add_photo_alternate,
                      size: 36,
                      color: MyConstant.dark,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ShowTitle buildSubTitle() {
    return ShowTitle(
      title:
          'รูปภาพแสดง ตัวตนของผู้ใช้งาน (แต่ถ้าไม่อยากแชร์รูป ทางเราจะแสดงรูปภาพอื่นๆแทน)',
      textStyle: MyConstant().h3Style(),
    );
  }

  Row buildRadioBuyer(double size) {
    // ignore: avoid_unnecessary_containers
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'user',
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value as String?;
              });
            },
            title: ShowTitle(
              title: 'ผู้สั่งซื้อ',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRadioSeller(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: avoid_unnecessary_containers
        // ignore: sized_box_for_whitespace
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'seller',
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value as String?;
              });
            },
            title: ShowTitle(
              title: 'ร้านค้า',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRadioRider(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: avoid_unnecessary_containers
        // ignore: sized_box_for_whitespace
        Container(
          width: size * 0.6,
          child: RadioListTile(
            value: 'rider',
            groupValue: typeUser,
            onChanged: (value) {
              setState(() {
                typeUser = value as String?;
              });
            },
            title: ShowTitle(
              title: 'ผู้ส่งสินค้า',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
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
            maxLines: 4,
            keyboardType: TextInputType.emailAddress,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              hintText: 'ที่อยู่ :',
              hintStyle: MyConstant().h3Style(),
              // ignore: prefer_const_constructors
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Icon(
                  Icons.home,
                  color: MyConstant.dark,
                ),
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
                Icons.phone,
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
                Icons.perm_identity_outlined,
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

  Row buildTitle(String title) {
    // ignore: prefer_const_constructors
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: avoid_unnecessary_containers
        // ignore: prefer_const_constructors
        Container(
          // ignore: prefer_const_constructors
          margin: EdgeInsets.only(top: 16),
          child: ShowTitle(
            title: title,
            textStyle: MyConstant().h2Style(),
          ),
        ),
      ],
    );
  }
}
