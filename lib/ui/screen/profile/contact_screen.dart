import 'package:contacts_service/contacts_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/dispose_keyboard.dart';

import '../../../const/app_icon.dart';
import '../../../core/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';
import '../categories/contact_select_screen.dart';
import '../categories/model/contact_model.dart';
import 'controller/profile_contact_controller.dart';

class ContactsScreen extends StatefulWidget {
  static const String routeName = '/contactsScreen';
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  ProfileContactController profileContactController =
      Get.find<ProfileContactController>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<Contact> contacts = [];
  List<ContactsListNameAndNumber> contacts2 = [];
  bool view = false;

  @override
  void initState() {
    super.initState();
    getContactPermission();
  }

  void getContactPermission() async {
    if (await Permission.contacts.isGranted) {
      fetchContacts();
    } else {
      await Permission.contacts.request();
      getContactPermission();
    }
  }

  void fetchContacts() async {
    EasyLoading.show();
    contacts = await ContactsService.getContacts();
    //print("====00==----==> ${contacts.length}");
    for (int i = 0; i < contacts.length; i++) {
      contacts2.add(ContactsListNameAndNumber(
          name: contacts[i].givenName ?? "null",
          number: contacts[i].phones == null
              ? "null"
              : contacts[i].phones == null
                  ? "null"
                  : contacts[i].phones!.isEmpty
                      ? "null"
                      : contacts[i].phones![0].value ?? "null",
          email: contacts[i].emails == null
              ? "0"
              : contacts[i].emails!.isEmpty
                  ? "null"
                  : contacts[i].emails![0].value ?? "null"));
    }
    print("======----==> ${contacts2.length}");
    if (contacts.isNotEmpty) {
      EasyLoading.show();
      setState(() {});
      await profileContactController.createListData();
      await profileContactController.sendContacts(contacts2);
      EasyLoading.dismiss();
      setState(() {});
    } else {
      showToast("data not fetching", Colors.black);
    }
    setState(() {
      view = true;
      showToast("contact fetch", Colors.black);
      EasyLoading.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.kScreenColor,
      body: Form(
        key: formKey,
        child: SafeArea(
          child: GetBuilder(
            builder: (ProfileContactController controller) {
              // if (controller.isLoading) {
              //   return Container();
              // }
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
                      "Contacts",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 4),
                          ]),
                      child: TextFormField(
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: AppColor.kIndigo)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: AppColor.kIndigo)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColor.kIndigo),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintStyle: TextStyle(color: Colors.black38),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                const EdgeInsets.only(top: 20, left: 15),
                            hintText: "Search Contacts",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                AppAssets.searchImage,
                                height: 20,
                              ),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          controller.createListDataList.length,
                          (index) => GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
                                      child: GestureDetector(
                                        onTap: () {
                                          disposeKeyboard();
                                        },
                                        child: AlertDialog(
                                          backgroundColor:
                                              AppColor.kScreenColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          actions: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Image.asset(
                                                        AppAssets.back,
                                                        height: 55)),
                                              ],
                                            ),
                                            Container(
                                              width: 320,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 20),
                                                    const Text(
                                                      "First & Last Name",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 15),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      height: 40,
                                                      child: TextFormField(
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                        ),
                                                        controller:
                                                            firstController,
                                                        textAlignVertical:
                                                            TextAlignVertical
                                                                .center,
                                                        validator: (val) => val!
                                                                .trim()
                                                                .isEmpty
                                                            ? "Please add You First Name"
                                                            : null,
                                                        decoration:
                                                            InputDecoration(
                                                          errorBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide: BorderSide(
                                                                  color: AppColor
                                                                      .kIndigo)),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide: BorderSide(
                                                                  color: AppColor
                                                                      .kIndigo)),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: AppColor
                                                                    .kIndigo),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          hintStyle: TextStyle(
                                                              color: Colors
                                                                  .black38),
                                                          fillColor:
                                                              Colors.white,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 20,
                                                                  left: 15),
                                                          hintText:
                                                              "First Name",
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    Text(
                                                      "Phone Number",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 15),
                                                    ),
                                                    SizedBox(height: 5),
                                                    SizedBox(
                                                      height: 60,
                                                      child: TextFormField(
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                        ),
                                                        controller:
                                                            phoneController,
                                                        maxLength: 10,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        textAlignVertical:
                                                            TextAlignVertical
                                                                .center,
                                                        validator: (val) => val!
                                                                .trim()
                                                                .isEmpty
                                                            ? "Please add You Phone Number"
                                                            : null,
                                                        decoration:
                                                            InputDecoration(
                                                          errorBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide: BorderSide(
                                                                  color: AppColor
                                                                      .kIndigo)),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide: BorderSide(
                                                                  color: AppColor
                                                                      .kIndigo)),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: AppColor
                                                                    .kIndigo),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          hintStyle: TextStyle(
                                                              color: Colors
                                                                  .black38),
                                                          fillColor:
                                                              Colors.white,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 20,
                                                                  left: 15),
                                                          hintText:
                                                              "Phone Number",
                                                        ),
                                                      ),
                                                    ),
                                                    const Text(
                                                      "Email Address",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 15),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      height: 40,
                                                      child: TextFormField(
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                        ),
                                                        controller:
                                                            emailController,
                                                        textAlignVertical:
                                                            TextAlignVertical
                                                                .center,
                                                        validator: (val) =>
                                                            EmailValidator
                                                                    .validate(
                                                                        val!)
                                                                ? null
                                                                : "Please Enter Valid Email",
                                                        decoration:
                                                            InputDecoration(
                                                          errorBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide: BorderSide(
                                                                  color: AppColor
                                                                      .kIndigo)),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide: BorderSide(
                                                                  color: AppColor
                                                                      .kIndigo)),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: AppColor
                                                                    .kIndigo),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          hintStyle: TextStyle(
                                                              color: Colors
                                                                  .black38),
                                                          fillColor:
                                                              Colors.white,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 20,
                                                                  left: 15),
                                                          hintText: "Email",
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Center(
                                                        child: Container(
                                                          height: 45,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40)),
                                                          child: const Center(
                                                            child: Text(
                                                              "Save",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 14),
                                                    Center(
                                                      child: Container(
                                                        height: 45,
                                                        decoration: BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40)),
                                                        child: const Center(
                                                          child: Text(
                                                            "Delete Contact",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Padding(
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
                                      Image.asset(AppAssets.profile,
                                          height: 48),
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
                                                  fontWeight: FontWeight.w600)),
                                          SizedBox(height: 5),
                                          Text(
                                              controller
                                                  .createListDataList[index]
                                                  .mobileNumber,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      Spacer(),
                                      Icon(Icons.arrow_forward_ios_rounded,
                                          size: 18),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColor.kIndigo),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                "SYNC Contact from Mobile to App",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  TextEditingController firstController2 =
                                      TextEditingController();
                                  TextEditingController phoneController2 =
                                      TextEditingController();
                                  TextEditingController emailController2 =
                                      TextEditingController();
                                  GlobalKey<FormState> formKey2 =
                                      GlobalKey<FormState>();
                                  return Form(
                                    key: formKey2,
                                    child: GestureDetector(
                                      onTap: () {
                                        disposeKeyboard();
                                      },
                                      child: AlertDialog(
                                        backgroundColor: AppColor.kScreenColor,
                                        scrollable: true,
                                        content: SizedBox(
                                          width: 400,
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Image.asset(
                                                      AppAssets.back,
                                                      height: 55,
                                                    )),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 20),
                                                    const Text(
                                                      "First & Last Name",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 15),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    TextFormField(
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),
                                                      controller:
                                                          firstController2,
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      validator: (val) => val!
                                                              .trim()
                                                              .isEmpty
                                                          ? "Please add You First Name and Last Name"
                                                          : null,
                                                      decoration:
                                                          InputDecoration(
                                                        errorBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            borderSide: BorderSide(
                                                                color: AppColor
                                                                    .kIndigo)),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                borderSide: BorderSide(
                                                                    color: AppColor
                                                                        .kIndigo)),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColor
                                                                  .kIndigo),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        hintStyle: TextStyle(
                                                            color:
                                                                Colors.black38),
                                                        fillColor: Colors.white,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 15,
                                                                left: 15,
                                                                bottom: 15),
                                                        hintText: "Name",
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    Text(
                                                      "Phone Number",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 15),
                                                    ),
                                                    SizedBox(height: 5),
                                                    TextFormField(
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),
                                                      controller:
                                                          phoneController2,
                                                      maxLength: 10,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      validator: (val) => val!
                                                              .trim()
                                                              .isEmpty
                                                          ? "Please add You Phone Number"
                                                          : null,
                                                      decoration:
                                                          InputDecoration(
                                                        errorBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            borderSide: BorderSide(
                                                                color: AppColor
                                                                    .kIndigo)),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                borderSide: BorderSide(
                                                                    color: AppColor
                                                                        .kIndigo)),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColor
                                                                  .kIndigo),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        hintStyle: TextStyle(
                                                            color:
                                                                Colors.black38),
                                                        fillColor: Colors.white,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 20,
                                                                left: 15),
                                                        hintText:
                                                            "Phone Number",
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text(
                                                      "Email Address",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 15),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    TextFormField(
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),
                                                      controller:
                                                          emailController2,
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      validator: (val) =>
                                                          EmailValidator
                                                                  .validate(
                                                                      val!)
                                                              ? null
                                                              : "Please Enter Valid Email",
                                                      decoration:
                                                          InputDecoration(
                                                        errorBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            borderSide: BorderSide(
                                                                color: AppColor
                                                                    .kIndigo)),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                borderSide: BorderSide(
                                                                    color: AppColor
                                                                        .kIndigo)),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: AppColor
                                                                  .kIndigo),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        hintStyle: TextStyle(
                                                            color:
                                                                Colors.black38),
                                                        fillColor: Colors.white,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 20,
                                                                left: 15),
                                                        hintText: "Email",
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        disposeKeyboard();
                                                        if (formKey2
                                                            .currentState!
                                                            .validate()) {
                                                          formKey2.currentState!
                                                              .save();
                                                          EasyLoading.show();
                                                          final response =
                                                              await controller
                                                                  .createContact(
                                                            firstController2
                                                                .text
                                                                .trim(),
                                                            emailController2
                                                                .text
                                                                .trim(),
                                                            phoneController2
                                                                .text
                                                                .trim(),
                                                          );
                                                          EasyLoading.dismiss();
                                                          response.when(
                                                            success: (data) {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                      ),
                                                                      actions: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(horizontal: 30),
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              SizedBox(height: 10),
                                                                              Center(
                                                                                child: Text(
                                                                                  "Contact Saved!",
                                                                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: 15),
                                                                              Center(
                                                                                child: Text(
                                                                                  "Your contact will be saved in your contact list successfully.",
                                                                                  textAlign: TextAlign.center,
                                                                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: 20),
                                                                              GestureDetector(
                                                                                onTap: () {
                                                                                  Get.back();
                                                                                  Get.back();
                                                                                },
                                                                                child: Center(
                                                                                  child: Container(
                                                                                    height: 35,
                                                                                    width: 60,
                                                                                    decoration: BoxDecoration(color: AppColor.kIndigo, borderRadius: BorderRadius.circular(10)),
                                                                                    child: Center(
                                                                                        child: Text(
                                                                                      "ok",
                                                                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
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
                                                            failure: (ErrorType
                                                                    type,
                                                                String?
                                                                    message) {
                                                              showToast(
                                                                  message!,
                                                                  Colors.red);
                                                            },
                                                          );
                                                        }
                                                      },
                                                      child: Center(
                                                        child: Container(
                                                          height: 45,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40)),
                                                          child: const Center(
                                                            child: Text(
                                                              "Save",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),
                                                  ],
                                                ),
                                              ]),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColor.kIndigo),
                              color: Color(0xff012130),
                            ),
                            child: Center(
                              child: Text(
                                "Create Contact",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
