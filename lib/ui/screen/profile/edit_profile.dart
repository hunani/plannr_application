import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/core/utils/flitter_toast.dart';
import 'package:plannr_app/ui/screen/dashboad/dashboad_screen.dart';
import 'package:plannr_app/ui/screen/profile/controller/profile_controller.dart';
import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
import '../../../const/dispose_keyboard.dart';
import '../../../core/utils/base_response.dart';
import '../../../main.dart';
import '../../../widget/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = '/editProfileScreen';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: AppColor.kScreenColor,
          body: SafeArea(
            child: GetBuilder(
              builder: (ProfileController controller) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset(AppAssets.back, height: 55)),
                          Center(
                              child: Image.asset(
                            AppAssets.appNameImage,
                            fit: BoxFit.cover,
                            height: 70,
                          )),
                          GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                AppAssets.back,
                                height: 55,
                                color: Colors.transparent,
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            GetBuilder(
                              builder: (ImagePickerController
                                  imagePickerController) {
                                return GestureDetector(
                                  onTap: () {
                                    disposeKeyboard();
                                    appImagePicker
                                        .openBottomSheet()
                                        .then((value) {
                                      if (appImagePicker
                                              .imagePickerController.image !=
                                          null) {
                                        controller.imagePath = appImagePicker
                                            .imagePickerController.image;
                                        imagePickerController.resetImage();
                                        controller.update();
                                      }
                                    });
                                  },
                                  child: controller.imagePath != null
                                      ? Container(
                                          height: 130,
                                          width: 130,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black12,
                                            image: DecorationImage(
                                                image: FileImage(
                                                    controller.imagePath!),
                                                fit: BoxFit.cover),
                                          ),
                                        )
                                      : Container(
                                          height: 130,
                                          width: 130,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black12,
                                          ),
                                          // child: Center(
                                          //   child: ClipRRect(
                                          //     borderRadius: BorderRadius.circular(200),
                                          //     child: Image.(
                                          //       controller.profileDataModel!.image,
                                          //       fit: BoxFit.cover,
                                          //     ),
                                          //   ),
                                          //
                                          // ),
                                        ),
                                );
                              },
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Change Photo",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 20),
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
                              validator: (val) => EmailValidator.validate(val!)
                                  ? null
                                  : "Please Enter Valid Email",
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
                                  phoneNumberController.text.length != 10
                                      ? "Please Enter Valid Phone Number"
                                      : null,
                              keyboardType: TextInputType.number,
                              maxLength: 10,
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
                            SizedBox(height: 30),
                            GestureDetector(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  if (controller.imagePath != null) {
                                    EasyLoading.show();
                                    final response =
                                        await controller.editProfile(
                                            emailAddressController.text.trim(),
                                            phoneNumberController.text.trim());
                                    EasyLoading.dismiss();
                                    response.when(
                                      success: (data) {
                                        Get.back();
                                        showToast(
                                            "User Profile Update Successfully",
                                            Colors.black);
                                      },
                                      failure:
                                          (ErrorType type, String? message) {
                                        Fluttertoast.showToast(
                                          msg: message!,
                                          gravity: ToastGravity.CENTER,
                                          textColor: Colors.red,
                                          backgroundColor: Colors.black38,
                                        );
                                      },
                                    );
                                  } else {
                                    EasyLoading.dismiss();
                                    showToast("please upload Your profile",
                                        Colors.black);
                                  }
                                }
                              },
                              child: Container(
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
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: () async {
                                EasyLoading.show();
                                final response = await controller.userDelete();
                                EasyLoading.dismiss();
                                response.when(
                                  success: (data) {
                                    Get.back();
                                    showToast("Profile Deleted Successfully",
                                        Colors.black);
                                    Get.offAllNamed(DashboadScreen.routeName);
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
                            ),
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
