import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/categories/controller/contact_list_controller.dart';
import '../../../../const/app_icon.dart';
import '../../../../const/dispose_keyboard.dart';
import '../../../../core/utils/base_response.dart';
import '../../../../core/utils/flitter_toast.dart';
import '../model/create_list_model.dart';
import 'show_select_contacts.dart';

class ContactsSelectScreen extends StatefulWidget {
  static const String routeName = '/contactsSelectScreen';
  const ContactsSelectScreen({Key? key}) : super(key: key);

  @override
  State<ContactsSelectScreen> createState() => _ContactsSelectScreenState();
}

class _ContactsSelectScreenState extends State<ContactsSelectScreen> {
  List<int> selectContactsList = [];
  int? productId;
  @override
  void initState() {
    productId = Get.arguments;
    super.initState();
  }

  TextEditingController firstController2 = TextEditingController();
  TextEditingController phoneController2 = TextEditingController();
  TextEditingController emailController2 = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: GetBuilder(
            builder: (ContactListController controller) {
              return Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(AppAssets.back, height: 55)),
                      Spacer(),
                      Center(
                          child: Image.asset(
                        AppAssets.appNameImage,
                        fit: BoxFit.cover,
                        height: 70,
                      )),
                      Spacer(),
                      GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            AppAssets.back,
                            height: 55,
                            color: Colors.transparent,
                          )),
                    ],
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "Add Guests",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                    ),
                  ),
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.createListDataList == []
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                const Text(
                                  "First & Last Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  controller: firstController2,
                                  textAlignVertical: TextAlignVertical.center,
                                  validator: (val) => val!.trim().isEmpty
                                      ? "Please add You First Name and Last Name"
                                      : null,
                                  decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: AppColor.kIndigo)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: AppColor.kIndigo)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.kIndigo),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    hintStyle: TextStyle(color: Colors.black38),
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        top: 15, left: 15, bottom: 15),
                                    hintText: "Name",
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  "Phone Number",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
                                ),
                                SizedBox(height: 5),
                                TextFormField(
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  controller: phoneController2,
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  textAlignVertical: TextAlignVertical.center,
                                  validator: (val) => val!.trim().isEmpty
                                      ? "Please add You Phone Number"
                                      : null,
                                  decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: AppColor.kIndigo)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: AppColor.kIndigo)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.kIndigo),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    hintStyle: TextStyle(color: Colors.black38),
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        top: 20, left: 15),
                                    hintText: "Phone Number",
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Email Address",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  controller: emailController2,
                                  textAlignVertical: TextAlignVertical.center,
                                  validator: (val) =>
                                      EmailValidator.validate(val!)
                                          ? null
                                          : "Please Enter Valid Email",
                                  decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: AppColor.kIndigo)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: AppColor.kIndigo)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.kIndigo),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    hintStyle: TextStyle(color: Colors.black38),
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        top: 20, left: 15),
                                    hintText: "Email",
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () async {
                                    disposeKeyboard();
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      EasyLoading.show();
                                      final response =
                                          await controller.createContact(
                                        firstController2.text.trim(),
                                        emailController2.text.trim(),
                                        phoneController2.text.trim(),
                                      );
                                      EasyLoading.dismiss();
                                      response.when(
                                        success: (data) {
                                          controller.createListData();
                                          setState(() {});
                                        },
                                        failure:
                                            (ErrorType type, String? message) {
                                          showToast(message!, Colors.red);
                                        },
                                      );
                                    }
                                  },
                                  child: Center(
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: const Center(
                                        child: Text(
                                          "Save",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                controller.createListDataList.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, right: 15, left: 15),
                                  child: Container(
                                    height: 60,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        children: [
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
                                                child: Image.asset(
                                                    AppAssets.addGuest),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  controller
                                                      .createListDataList[index]
                                                      .name,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              SizedBox(height: 5),
                                              Text(
                                                  controller
                                                      .createListDataList[index]
                                                      .mobileNumber,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            ],
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              if (selectContactsList.contains(
                                                  controller
                                                      .createListDataList[index]
                                                      .id)) {
                                                selectContactsList.remove(
                                                    controller
                                                        .createListDataList[
                                                            index]
                                                        .id);
                                              } else {
                                                selectContactsList.add(
                                                    controller
                                                        .createListDataList[
                                                            index]
                                                        .id);
                                              }
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: selectContactsList
                                                        .contains(controller
                                                            .createListDataList[
                                                                index]
                                                            .id)
                                                    ? AppColor.kIndigo
                                                    : Colors.white,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: selectContactsList
                                                      .contains(controller
                                                          .createListDataList[
                                                              index]
                                                          .id)
                                                  ? Icon(Icons.done,
                                                      size: 19,
                                                      color: Colors.white)
                                                  : Container(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () async {
                      EasyLoading.show();
                      final response = await controller.contactListSubmitList(
                          productId!, selectContactsList);
                      EasyLoading.dismiss();
                      response.when(
                        success: (data) {
                          Get.toNamed(ShowSelectContactsScreen.routeName,
                              arguments: productId);
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
                      // Get.toNamed(ShowSelectContactsScreen.routeName,
                      //     arguments: productId);
                      // print("========> ${productId}");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Invite all ${selectContactsList.length} contacts",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
