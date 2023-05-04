import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/app_icon.dart';
import 'package:plannr_app/const/dispose_keyboard.dart';
import 'package:plannr_app/ui/screen/events/gues_messages_screen.dart';

class EditContactScreen extends StatefulWidget {
  static const String routeName = '/editContactScreen';
  const EditContactScreen({Key? key}) : super(key: key);

  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  int quantityIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        backgroundColor: AppColor.kScreenColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                      height: 100,
                      width: 200,
                      color: Colors.transparent,
                      child: Center(
                          child: Image.asset(
                        AppAssets.appNameImage,
                        fit: BoxFit.cover,
                      ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(AppAssets.back, height: 55)),
                      Text(
                        "Edit Contact",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Image.asset(AppAssets.back,
                              height: 55, color: Colors.transparent)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: nameController,
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
                          contentPadding:
                              const EdgeInsets.only(top: 20, left: 15),
                          hintText: "Guest Name",
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: emailController,
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
                          contentPadding:
                              const EdgeInsets.only(top: 20, left: 15),
                          hintText: "Email",
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
                        keyboardType: TextInputType.number,
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
                          contentPadding:
                              const EdgeInsets.only(top: 20, left: 15),
                          hintText: "Phone Number",
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: statusController,
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
                          contentPadding:
                              const EdgeInsets.only(top: 20, left: 15),
                          hintText: "Status",
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Guest",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (quantityIndex <= 0) {
                                } else {
                                  quantityIndex = quantityIndex - 1;
                                  setState(() {});
                                }
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: AppColor.kIndigo,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              quantityIndex.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                quantityIndex = quantityIndex + 1;
                                setState(() {});
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: AppColor.kIndigo,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(GuesMessagesScreen.routeName);
                            },
                            child: Container(
                              height: 40,
                              width: 160,
                              decoration: BoxDecoration(
                                color: AppColor.kIndigo,
                              ),
                              child: Center(
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.kIndigo),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60),
                    ],
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
