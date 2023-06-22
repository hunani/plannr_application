import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/categories/controller/create_contact_controller.dart';

import '../../../const/app_icon.dart';
import '../../../const/dispose_keyboard.dart';
import '../../../core/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';
import 'contact_select_screen.dart';

class CreateContactPage extends StatefulWidget {
  static const String routeName = '/createContactPage';
  const CreateContactPage({Key? key}) : super(key: key);

  @override
  State<CreateContactPage> createState() => _CreateContactPageState();
}

class _CreateContactPageState extends State<CreateContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        backgroundColor: AppColor.kScreenColor,
        body: Form(
          key: formKey,
          child: SafeArea(
            child: GetBuilder(
              builder: (CreateContactController controller) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
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
                              "Create Contact",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  AppAssets.back,
                                  height: 55,
                                  color: Colors.transparent,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
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
                                    borderSide:
                                        BorderSide(color: AppColor.kIndigo)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: AppColor.kIndigo)),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.kIndigo),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintStyle: TextStyle(color: Colors.black38),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.only(top: 20, left: 15),
                                hintText: "Name",
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              textAlignVertical: TextAlignVertical.center,
                              maxLength: 10,
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
                                  borderSide:
                                      BorderSide(color: AppColor.kIndigo),
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
                                    borderSide:
                                        BorderSide(color: AppColor.kIndigo)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: AppColor.kIndigo)),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.kIndigo),
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
                            SizedBox(height: 70),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    disposeKeyboard();
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      EasyLoading.show();
                                      final response =
                                          await controller.createContact(
                                        nameController.text.trim(),
                                        emailController.text.trim(),
                                        phoneController.text.trim(),
                                      );
                                      EasyLoading.dismiss();
                                      response.when(
                                        success: (data) {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  actions: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 30),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(height: 10),
                                                          Center(
                                                            child: Text(
                                                              "Contact Saved!",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 22),
                                                            ),
                                                          ),
                                                          SizedBox(height: 15),
                                                          Center(
                                                            child: Text(
                                                              "Your contact will be saved in your contact list successfully.",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 18),
                                                            ),
                                                          ),
                                                          SizedBox(height: 20),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Get.toNamed(
                                                                  ContactSelectScreen
                                                                      .routeName);
                                                              //Get.back();
                                                            },
                                                            child: Center(
                                                              child: Container(
                                                                height: 35,
                                                                width: 60,
                                                                decoration: BoxDecoration(
                                                                    color: AppColor
                                                                        .kIndigo,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child: Center(
                                                                    child: Text(
                                                                  "ok",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                        failure:
                                            (ErrorType type, String? message) {
                                          print("fdsfdsf");
                                          showToast(message!, Colors.red);
                                        },
                                      );
                                    }
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
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColor.kIndigo),
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
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
