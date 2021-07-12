import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sekfoods/utillity/my_constant.dart';
import 'package:sekfoods/utillity/my_dialog.dart';
import 'package:sekfoods/widgets/show_image.dart';
import 'package:sekfoods/widgets/show_progress.dart';
import 'package:sekfoods/widgets/show_title.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? typeUser;
  File? file;
  double? lat, lng;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    checkPermission();
  }

  // ignore: prefer_void_to_null
  Future<Null> checkPermission() async {
    bool locationService;
    // ignore: unused_local_variable
    LocationPermission locationPermission;

    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      // ignore: avoid_print
      print('Service Location Open');

      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'ไม่อนุญาติแชร์ Location', 'โปรดแชร์ Location');
        } else {
          // File LatLong
          findLatLng();
        }
      } else {
        if (locationPermission == LocationPermission.deniedForever) {
          MyDialog().alertLocationService(
              context, 'ไม่อนุญาติแชร์ Location', 'โปรดแชร์ Location');
        } else {
          // File LatLong
          findLatLng();
        }
      }
    } else {
      // ignore: avoid_print
      print('Service Location Close');
      MyDialog().alertLocationService(context, 'Location Service ปิดอยู่ ?',
          'กรุณาเปิด Location Service ด้วยค่ะ');
    }
  }

  // ignore: prefer_void_to_null
  Future<Null> findLatLng() async {
    // ignore: avoid_print
    print('findLatLng == Working');
    Position? position = await findPosition();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;
      // ignore: avoid_print
      print('lat =$lat,lng =$lng');
    });
  }

  Future<Position?> findPosition() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(
        actions: [
          buildCreateNewAccount(),
        ],
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
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
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
                buildAvatar(size),
                buildTitle('แสดงพิกัดทีคุณอยู่'),
                buildMap(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildCreateNewAccount() {
    return IconButton(
      onPressed: () {
        if (formkey.currentState!.validate()) {
          if (typeUser == null) {
            // ignore: avoid_print
            print('Non Type User');
            MyDialog().normalDilog(
                context,
                'ยังไม่ได้เลือกประเภทของผู้สมัครสมาชิก',
                'กรุณาเลือกชนิดของผู้สมัครด้วยค่ะ');
          } else {
            // ignore: avoid_print
            print('Process Insert of Database');
          }
        }
      },
      // ignore: prefer_const_constructors
      icon: Icon(Icons.cloud_upload),
    );
  }

  // ignore: non_constant_identifier_names
  // ignore: prefer_collection_literals
  Set<Marker> setMarker() => <Marker>[
        // ignore: prefer_const_constructors
        Marker(
          // ignore: prefer_const_constructors
          markerId: MarkerId('id'),
          position: LatLng(lat!, lng!),
          // ignore: prefer_const_constructors
          infoWindow: InfoWindow(
              title: 'คุณอยู่ที่นี้', snippet: 'lat = $lat, lng = $lng'),
        ),
      ].toSet();

  // ignore: avoid_unnecessary_containers
  // ignore: sized_box_for_whitespace
  // ignore: prefer_const_constructors
  Widget buildMap() => Container(
        // ignore: prefer_const_constructors
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        height: 300,
        // ignore: prefer_const_constructors
        child: lat == null
            // ignore: prefer_const_constructors
            ? ShowProgress()
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat!, lng!),
                  zoom: 16,
                ),
                onMapCreated: (controller) {},
                markers: setMarker(),
              ),
      );

  // ignore: prefer_void_to_null
  Future<Null> chooseImage(ImageSource source) async {
    try {
      // ignore: unused_local_variable
      var result = await ImagePicker()
          .getImage(source: source, maxWidth: 800, maxHeight: 800);
      setState(() {
        file = File(result!.path);
      });
      // ignore: empty_catches
    } catch (e) {}
  }

  Row buildAvatar(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ignore: prefer_const_constructors
        Container(
          // ignore: prefer_const_constructors
          margin: EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 10,
          ),
          child: IconButton(
            onPressed: () => chooseImage(ImageSource.camera),
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
          child: file == null
              ? ShowImage(path: MyConstant.avatar)
              : Image.file(file!),
        ),
        // ignore: prefer_const_constructors
        Container(
          // ignore: prefer_const_constructors
          margin: EdgeInsets.symmetric(
            vertical: 36,
            horizontal: 10,
          ),
          child: IconButton(
            onPressed: () => chooseImage(ImageSource.gallery),
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.add_photo_alternate,
              size: 28,
              color: MyConstant.dark,
            ),
          ),
        ),
      ],
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
          width: size * 0.6,
          // ignore: prefer_const_constructors
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณาใส่ ชื่อให้เรียบร้อยด้วยค่ะ';
              } else {}
            },
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
          width: size * 0.6,
          // ignore: prefer_const_constructors
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณาใส่ที่อยู่ให้เรียบร้อยด้วยค่ะ';
              } else {}
            },
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
          width: size * 0.6,
          // ignore: prefer_const_constructors
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณาใส่หมายเลขโทรศัพท์ให้เรียบร้อยด้วยค่ะ';
              } else {}
            },
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
          width: size * 0.6,
          // ignore: prefer_const_constructors
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณาใส่ USER ให้เรียบร้อยด้วยค่ะ';
              } else {}
            },
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
          width: size * 0.6,
          // ignore: prefer_const_constructors
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณาใส่ Password ด้วยค่ะ';
              } else {}
            },
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
