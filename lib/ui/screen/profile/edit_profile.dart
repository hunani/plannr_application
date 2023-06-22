import 'package:flutter/material.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = '/editProfileScreen';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Center(
                      child: Image.asset(
                    AppAssets.appNameImage,
                    fit: BoxFit.cover,
                    height: 70,
                  )),
                ),
                Image.asset(AppAssets.userImage1, height: 130),
                SizedBox(height: 20),
                Text(
                  "Change Photo",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: emailAddressController,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  validator: (val) =>
                      val!.trim().isEmpty ? "field required" : null,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColor.kIndigo)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColor.kIndigo)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.kIndigo),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.only(top: 20, left: 15),
                    hintText: "Email Address",
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: phoneNumberController,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  validator: (val) =>
                      val!.trim().isEmpty ? "field required" : null,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColor.kIndigo)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColor.kIndigo)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.kIndigo),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.only(top: 20, left: 15),
                    hintText: "Phone Number",
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.kIndigo,
                  ),
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.kIndigo),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "Delete Account",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
