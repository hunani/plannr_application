import 'dart:math';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/core/utils/flitter_toast.dart';
import 'package:plannr_app/ui/screen/categories/widget/bottom_sheet.dart';
import '../../../const/app_icon.dart';
import '../../../core/utils/base_response.dart';
import 'controller/create_contact_controller.dart';
import 'controller/create_list_controller.dart';
import 'model/create_list_model.dart';

class AddGuestScreen extends StatefulWidget {
  static const String routeName = '/addGuestScreen';
  const AddGuestScreen({Key? key}) : super(key: key);

  @override
  State<AddGuestScreen> createState() => _AddGuestScreenState();
}

class _AddGuestScreenState extends State<AddGuestScreen> {
  int select = 0;
  List<int> list2 = [];
  List<String> list = [
    "Addai",
    "Boampong",
    "Akua",
    "Amponsah",
    "Boampong1",
    "Bisa K Dei",
    "Akua1",
    "Amponsah1",
  ];

  @override
  void initState() {
    print("===========>${Get.arguments}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CreateContactDataController controller) {
        return Scaffold(
          backgroundColor: AppColor.kScreenColor,
          body: SafeArea(
            child: Stack(
              children: [
                Column(
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
                          Spacer(),
                          Text(
                            "Add Guest",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              bottomSheet();
                            },
                            child: Icon(
                              Icons.share_rounded,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 4),
                            ]),
                        child: TextFormField(
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          validator: (val) =>
                              val!.trim().isEmpty ? "field required" : null,
                          decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: AppColor.kIndigo)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: AppColor.kIndigo)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.kIndigo),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintStyle: TextStyle(color: Colors.black38),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding:
                                  const EdgeInsets.only(top: 20, left: 15),
                              hintText: "Search Contacts",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Image.asset(
                                  AppAssets.searchImage,
                                  height: 20,
                                  color: AppColor.kIndigo,
                                ),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              ...List.generate(
                                controller.createListDataList.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (list2.contains(controller
                                              .createListDataList[index].id)) {
                                            list2.remove(controller
                                                .createListDataList[index].id);
                                          } else {
                                            list2.add(controller
                                                .createListDataList[index].id);
                                          }
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: list2.contains(controller
                                                    .createListDataList[index]
                                                    .id)
                                                ? AppColor.kIndigo
                                                : Colors.white,
                                            border: Border.all(
                                                color: list2.contains(controller
                                                            .createListDataList[
                                                        index])
                                                    ? AppColor.kIndigo
                                                    : Colors.black),
                                          ),
                                          child: list2.contains(controller
                                                  .createListDataList[index].id)
                                              ? Center(
                                                  child: Icon(Icons.done,
                                                      color: Colors.white))
                                              : Container(),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Center(
                                            child:
                                                Image.asset(AppAssets.addGuest),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 30),
                                      Text(
                                        controller
                                            .createListDataList[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 40,
                  left: 100,
                  right: 100,
                  child: GestureDetector(
                    onTap: () async {
                      EasyLoading.show();
                      final response = await controller.contactListSubmitList(
                          Get.arguments, list2);
                      EasyLoading.dismiss();
                      response.when(
                        success: (data) {
                          showToast("Mail Send all gets", Colors.black);
                        },
                        failure: (ErrorType type, String? message) {
                          Fluttertoast.showToast(
                            msg: message!,
                            gravity: ToastGravity.CENTER,
                            textColor: Colors.red,
                            backgroundColor: Colors.black38,
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColor.kIndigo,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Send",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
