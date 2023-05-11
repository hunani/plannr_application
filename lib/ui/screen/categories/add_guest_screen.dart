import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/categories/widget/bottom_sheet.dart';
import '../../../const/app_icon.dart';

class AddGuestScreen extends StatefulWidget {
  static const String routeName = '/addGuestScreen';
  const AddGuestScreen({Key? key}) : super(key: key);

  @override
  State<AddGuestScreen> createState() => _AddGuestScreenState();
}

class _AddGuestScreenState extends State<AddGuestScreen> {
  int select = 0;
  List<String> list2 = [];
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    Spacer(),
                    Text(
                      "Add Guest",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
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
                child: Column(
                  children: [
                    Container(
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
                    SizedBox(height: 30),
                    ...List.generate(
                      list.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (list2.contains(list[index])) {
                                  list2.remove(list[index]);
                                } else {
                                  list2.add(list[index]);
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: list2.contains(list[index])
                                      ? AppColor.kIndigo
                                      : Colors.white,
                                  border: Border.all(
                                      color: list2.contains(list[index])
                                          ? AppColor.kIndigo
                                          : Colors.black),
                                ),
                                child: list2.contains(list[index])
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
                                borderRadius: BorderRadius.circular(100),
                                child: Center(
                                  child: Image.asset(AppAssets.addGuest),
                                ),
                              ),
                            ),
                            SizedBox(width: 30),
                            Text(
                              list[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
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
