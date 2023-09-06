import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
import '../../../core/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';
import 'controller/cart_controller.dart';
import 'screen/create_invitation_screen.dart';

class SelectFilter extends StatefulWidget {
  static const String routeName = '/selectFilter';
  const SelectFilter({Key? key}) : super(key: key);

  @override
  State<SelectFilter> createState() => _SelectFilterState();
}

class _SelectFilterState extends State<SelectFilter> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  CartController cartController = Get.find<CartController>();
  @override
  void initState() {
    // EasyLoading.show();
    cartController.fitter(
      cartController.fillIndex == null
          ? "0"
          : cartController.fillIndex.toString(),
      cartController.id == null ? "0" : cartController.id.toString(),
    );
    // EasyLoading.dismiss();
    super.initState();
  }

  bool view = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(),
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: GetBuilder(
          builder: (CartController controller) {
            // if (controller.isLoading) {
            //   return Center(child: CircularProgressIndicator());
            // }
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(AppAssets.back, height: 60)),
                      Expanded(
                        child: Padding(
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
                                  hintText: "Enter your city",
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Image.asset(
                                      AppAssets.searchImage,
                                      height: 20,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: Image.asset(
                            AppAssets.filters,
                            height: 30,
                          ),
                        ),
                        Spacer(),
                        // controller.fitterList!.fitter.isEmpty
                        //     ? Text(
                        //         controller.fitterClearList == null
                        //             ? "0"
                        //             : "${controller.fitterClearList!.item}",
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.w500, fontSize: 17),
                        //       )
                        //     : Container(),

                        controller.fitterList!.fitter.isEmpty
                            ? Container()
                            : Text(
                                controller.fitterList == null
                                    ? "0 items"
                                    : "${controller.fitterList!.item} items",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                        controller.fitterClearList == null
                            ? Container()
                            : Text(
                                controller.fitterClearList == null
                                    ? "0 items"
                                    : "${controller.fitterClearList!.item} items",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        view == false
                            ? Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 30,
                                  width: 90,
                                  color: Colors.brown.shade50,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Free",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17),
                                        ),
                                        Spacer(),
                                        InkWell(
                                            onTap: () {
                                              view = true;
                                              setState(() {});
                                            },
                                            child: Image.asset(AppAssets.remove,
                                                height: 10)),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        InkWell(
                          onTap: () async {
                            EasyLoading.show();
                            final response =
                                await controller.fitterClear(34.toString());
                            EasyLoading.dismiss();
                            response.when(
                              success: (data) {
                                controller.fitterList!.fitter.clear();
                                view = true;
                                setState(() {});
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
                            height: 30,
                            width: 100,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                "Clear All",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: controller.fitterList!.fitter
                          .asMap()
                          .map((index, value) => MapEntry(
                                index,
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                        CreateInvitationScreen.routeName,
                                        arguments: value.id);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                blurRadius: 4)
                                          ]),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5, top: 5),
                                            child: Container(
                                              height: 220,
                                              child: Image.network(
                                                  value.imagePath,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(AppAssets.hero,
                                                  height: 14),
                                              SizedBox(width: 10),
                                              Text(
                                                value.freeOrPremium == 0
                                                    ? "Free Invitation"
                                                    : "Premium Invitation",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            value.productTitle,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .values
                          .toList(),
                    ),
                  ),
                  // controller.fitterList!.fitter.isEmpty
                  //     ?
                  //     : Container(),

                  controller.fitterClearList == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: controller.fitterClearList!.fitter
                                .asMap()
                                .map((index, value) => MapEntry(
                                      index,
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              CreateInvitationScreen.routeName,
                                              arguments: value.id);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                      blurRadius: 4)
                                                ]),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5,
                                                          right: 5,
                                                          top: 5),
                                                  child: Container(
                                                    height: 220,
                                                    child: Image.network(
                                                        value.imagePath,
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(AppAssets.hero,
                                                        height: 14),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      value.freeOrPremium == 0
                                                          ? "Free Invitation"
                                                          : "Premium Invitation",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  value.productTitle,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                                SizedBox(height: 10),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                .values
                                .toList(),
                          ),
                        ),
                  SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget? drawer() {
    return GetBuilder(
      builder: (CartController controller) {
        return Container(
          width: 300,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 3)
                          ],
                          color: AppColor.kScreenColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    Text(
                      "Filter",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                    Text(
                      "Filter",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  width: 240,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.4), blurRadius: 4)
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(
                      children: List.generate(
                          controller.list.length,
                          (index) => Column(
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.fillIndex2 = index;
                                          setState(() {});
                                        },
                                        child: controller.fillIndex2 == index
                                            ? Icon(
                                                Icons.check_box_rounded,
                                                size: 27,
                                                color: Colors.black38,
                                              )
                                            : Icon(
                                                Icons.check_box_outline_blank,
                                                size: 27,
                                                color: Colors.black38,
                                              ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        controller.list[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(thickness: 1.5),
                                ],
                              )),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 240,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.4), blurRadius: 4)
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 5),
                    child: Wrap(
                      children: controller.colorDataList
                          .asMap()
                          .map((index, value) => MapEntry(
                              index,
                              InkWell(
                                onTap: () {
                                  controller.selectIndex2 = index;
                                  controller.id2 = value.id;
                                  setState(() {});
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(3),
                                  height: 17,
                                  width: 17,
                                  decoration: BoxDecoration(
                                    color: Color(
                                        int.parse("0xff${value.colorCode}")),
                                  ),
                                  child: controller.selectIndex2 == index
                                      ? Center(
                                          child: Icon(Icons.done,
                                              color: Colors.white, size: 12),
                                        )
                                      : Container(),
                                ),
                              )))
                          .values
                          .toList(),
                    ),
                  ),
                ),
                // Image.asset(
                //   AppAssets.colorImage,
                //   fit: BoxFit.cover,
                // ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () async {
                    EasyLoading.show();
                    final response = await controller.fitter(
                      controller.fillIndex2 == null
                          ? "0"
                          : controller.fillIndex2.toString(),
                      controller.id2 == null ? "0" : controller.id2.toString(),
                    );
                    EasyLoading.dismiss();
                    response.when(
                      success: (data) {
                        Get.back();
                      },
                      failure: (ErrorType type, String? message) {
                        showToast(getMessageFromErrorType(type), Colors.red);
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.kIndigo,
                    ),
                    child: Center(
                      child: Text(
                        "Apply",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    controller.fillIndex2 = null;
                    controller.selectIndex2 = null;
                    Get.back();
                  },
                  child: Container(
                    height: 47,
                    width: 240,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.kIndigo),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "Clear",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
