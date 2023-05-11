import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/dispose_keyboard.dart';
import 'package:plannr_app/ui/screen/categories/upload_screen.dart';

import '../../../const/app_icon.dart';

class CreateInvitationScreen extends StatefulWidget {
  static const String routeName = '/createInvitationScreen';
  const CreateInvitationScreen({Key? key}) : super(key: key);

  @override
  State<CreateInvitationScreen> createState() => _CreateInvitationScreenState();
}

class _CreateInvitationScreenState extends State<CreateInvitationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController timeController2 = TextEditingController();
  TextEditingController hostedController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messgeController = TextEditingController();
  TextEditingController foodController = TextEditingController();
  TextEditingController addController = TextEditingController();
  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030));
    if (picked != null)
      setState(
        () => {
          //data.registrationdate = picked.toString(),
          dateController.text = picked.toString()
        },
      );
  }

  List<String> list = ["50", "100", "150", "200"];
  List<String> list2 = ["50", "190", "120", "230"];
  String? soilSelect;
  String? soilSelect2;

  List<String> yesNoList = ["Yes", "No"];
  int yesNoIndex = 0;
  int yesNoIndex2 = 0;
  int yesNoIndex3 = 0;
  int yesNoIndex4 = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        backgroundColor: AppColor.kScreenColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                      "Create Invitation",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: Row(
                              children: [
                                Image.asset(AppAssets.loading, height: 30),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hang Tight",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "We’re Making Your Invitation Now....",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(AppAssets.happy4,
                                fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(UploadScreen.routeName);
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
                            "Preview Card",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
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
                            borderSide: BorderSide.none),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: TextStyle(color: Colors.black38),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.only(top: 20, left: 15),
                        hintText: "Name of the Event",
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      autocorrect: false,
                      readOnly: true,
                      controller: dateController,
                      onSaved: (value) {
                        //data.registrationdate = value;
                      },
                      onTap: () {
                        _selectDate();
                        FocusScope.of(context).requestFocus(new FocusNode());
                        print("object =======> ${_selectDate()}");
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.length < 1) {
                          return 'Choose Date';
                        }
                      },
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: TextStyle(color: Colors.black38),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.only(top: 20, left: 15),
                        hintText: "Event Date",
                        prefixIcon: Icon(Icons.calendar_today_outlined),
                        suffixIcon: Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "+  Add End Date",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      maxLines: 1,
                      controller: timeController,
                      readOnly: true, // add this line.
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: TextStyle(color: Colors.black38),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.only(top: 20, left: 15),
                        hintText: "Event Time",
                        prefixIcon: Icon(Icons.access_time_rounded),
                        suffixIcon: Icon(Icons.keyboard_arrow_down),
                      ),
                      onTap: () async {
                        TimeOfDay time = TimeOfDay.now();
                        FocusScope.of(context).requestFocus(new FocusNode());
                        TimeOfDay? picked = await showTimePicker(
                            context: context, initialTime: time);
                        if (picked != null && picked != time) {
                          timeController.text =
                              picked.toString(); // add this line.
                          setState(() {
                            time = picked;
                          });
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'cant be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "+  Add End Time",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      maxLines: 1,
                      controller: timeController2,
                      readOnly: true, // add this line.
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: TextStyle(color: Colors.black38),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.only(top: 20, left: 15),
                        hintText: "Time Zone",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            AppAssets.circalImage,
                            height: 1,
                          ),
                        ),
                        suffixIcon: Icon(Icons.keyboard_arrow_down),
                      ),
                      onTap: () async {
                        TimeOfDay time = TimeOfDay.now();
                        FocusScope.of(context).requestFocus(new FocusNode());
                        TimeOfDay? picked = await showTimePicker(
                            context: context, initialTime: time);
                        if (picked != null && picked != time) {
                          timeController2.text =
                              picked.toString(); // add this line.
                          setState(() {
                            time = picked;
                          });
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'cant be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: hostedController,
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
                              borderSide: BorderSide.none),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintStyle: TextStyle(color: Colors.black38),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.only(top: 20, left: 15),
                          hintText: "Hosted By",
                          prefixIcon: Icon(Icons.account_circle)),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "+  Add End host",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: locationController,
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
                              borderSide: BorderSide.none),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintStyle: TextStyle(color: Colors.black38),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.only(top: 20, left: 15),
                          hintText: "Location",
                          prefixIcon: Icon(Icons.location_on)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: phoneController,
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
                              borderSide: BorderSide.none),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintStyle: TextStyle(color: Colors.black38),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.only(top: 20, left: 15),
                          hintText: "Host's Phone Number",
                          prefixIcon: Icon(Icons.phone)),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Do you want to visible the Phone number to the Invited People ?",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    SizedBox(height: 15),
                    Row(
                        children: List.generate(
                            yesNoList.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          yesNoIndex = index;
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: yesNoIndex == index
                                              ? Center(
                                                  child: Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Text(yesNoList[index],
                                          style: TextStyle(fontSize: 15)),
                                    ],
                                  ),
                                ))),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: messgeController,
                      maxLines: 5,
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
                            borderSide: BorderSide.none),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: TextStyle(color: Colors.black38),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.only(top: 20, left: 15),
                        hintText: "Message",
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonHideUnderline(
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton2(
                          hint: Row(
                            children: [
                              Image.asset(AppAssets.moreImage, height: 17),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Type of Events",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.keyboard_arrow_down_outlined,
                                color: Colors.black),
                          ),
                          items: list
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, left: 20),
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                          value: soilSelect,
                          onChanged: (value) {
                            print("====================> ${value}");
                            soilSelect = value;
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonHideUnderline(
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton2(
                          hint: Row(
                            children: [
                              Image.asset(AppAssets.dressImage, height: 17),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Dress Code",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(Icons.keyboard_arrow_down_outlined,
                                color: Colors.black),
                          ),
                          items: list2
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, left: 20),
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                          value: soilSelect2,
                          onChanged: (value) {
                            print("====================> ${value}");
                            soilSelect2 = value;
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: locationController,
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
                            borderSide: BorderSide.none),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: TextStyle(color: Colors.black38),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.only(top: 20, left: 15),
                        hintText: "Food / Beverages",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset(
                            AppAssets.capImage,
                            height: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: addController,
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
                              borderSide: BorderSide.none),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintStyle: TextStyle(color: Colors.black38),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.only(top: 20, left: 15),
                          hintText: "Additional Information",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Icon(
                              Icons.message_outlined,
                              size: 19,
                            ),
                          )),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add Additional Admin / Event Organizer",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Row(
                              children: List.generate(
                                  yesNoList.length,
                                  (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                yesNoIndex2 = index;
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.black),
                                                ),
                                                child: yesNoIndex2 == index
                                                    ? Center(
                                                        child: Container(
                                                          height: 10,
                                                          width: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Text(yesNoList[index],
                                                style: TextStyle(fontSize: 15)),
                                          ],
                                        ),
                                      ))),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Add Chat Room",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "(\$2.99 per event)",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                              children: List.generate(
                                  yesNoList.length,
                                  (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                yesNoIndex3 = index;
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.black),
                                                ),
                                                child: yesNoIndex3 == index
                                                    ? Center(
                                                        child: Container(
                                                          height: 10,
                                                          width: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Text(yesNoList[index],
                                                style: TextStyle(fontSize: 15)),
                                          ],
                                        ),
                                      ))),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Invite More Than 2 People",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "(\$2.99 per event)",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                              children: List.generate(
                                  yesNoList.length,
                                  (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                yesNoIndex4 = index;
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.black),
                                                ),
                                                child: yesNoIndex4 == index
                                                    ? Center(
                                                        child: Container(
                                                          height: 10,
                                                          width: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Text(yesNoList[index],
                                                style: TextStyle(fontSize: 15)),
                                          ],
                                        ),
                                      ))),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            color: AppColor.kIndigo,
                          ),
                          child: Center(
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  color: Colors.white),
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
                              "Save Draft",
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
    );
  }
}
