import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/categories/controller/cart_controller.dart';

import '../../../../const/app_icon.dart';
import 'categories_screen.dart';
import 'create_invitation_screen.dart';

class ViewCategoriesScreen extends StatefulWidget {
  static const String routeName = '/viewCategoriesScreen';
  const ViewCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<ViewCategoriesScreen> createState() => _ViewCategoriesScreenState();
}

class _ViewCategoriesScreenState extends State<ViewCategoriesScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String? name;
  int? id;
  CartController cartController = Get.find<CartController>();
  @override
  void initState() {
    CategoriesModel2 categoriesModel2 = Get.arguments as CategoriesModel2;
    print("============> ${categoriesModel2.name}");
    print("============> ${categoriesModel2.id}");
    name = categoriesModel2.name;
    id = categoriesModel2.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        cartController.cart(id!);
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColor.kScreenColor,
        body: SafeArea(
          child: GetBuilder(
            builder: (CartController controller) {
              if (controller.isLoading) {
                return Container();
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(AppAssets.back, height: 60)),
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
                              height: 60,
                              color: Colors.transparent,
                            )),
                      ],
                    ),
                    SizedBox(height: 15),
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
                              hintText: "Birthday party",
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              // GestureDetector(
                              //   onTap: () {
                              //     _scaffoldKey.currentState?.openDrawer();
                              //   },
                              //   child: Image.asset(
                              //     AppAssets.filters,
                              //     height: 30,
                              //   ),
                              // ),
                              Spacer(),
                              Text(
                                controller.cartDataList == null
                                    ? "0 items"
                                    : "${controller.cartDataList!.item} items",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        controller.cartDataList!.cartData.isNotEmpty
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: AlignedGridView.count(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 10,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: controller
                                        .cartDataList!.cartData.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                              CreateInvitationScreen.routeName,
                                              arguments: controller
                                                  .cartDataList!
                                                  .cartData[index]
                                                  .id);
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
                                                    height: 140,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Colors.black12,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: Image.network(
                                                          controller
                                                              .cartDataList!
                                                              .cartData[index]
                                                              .imagePath,
                                                          fit: BoxFit.cover),
                                                    ),
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
                                                      controller
                                                                  .cartDataList!
                                                                  .cartData[
                                                                      index]
                                                                  .freeOrPremium ==
                                                              0
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
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Text(
                                                    controller
                                                        .cartDataList!
                                                        .cartData[index]
                                                        .productTitle,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 100),
                                child: Center(
                                    child: Text(
                                  "We don't have Pre-Made template available for ${name} We will add soon. Thank you",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Widget? drawer() {
  //   return GetBuilder(
  //     builder: (CartController controller) {
  //       return Container(
  //         width: 300,
  //         color: Colors.white,
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 15),
  //           child: Column(
  //             children: [
  //               const SizedBox(height: 50),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   GestureDetector(
  //                     onTap: () {
  //                       Get.back();
  //                     },
  //                     child: Container(
  //                       height: 35,
  //                       width: 35,
  //                       decoration: BoxDecoration(
  //                         boxShadow: [
  //                           BoxShadow(
  //                               color: Colors.black.withOpacity(0.4),
  //                               blurRadius: 3)
  //                         ],
  //                         color: AppColor.kScreenColor,
  //                         borderRadius: BorderRadius.circular(5),
  //                       ),
  //                       child: Center(
  //                         child: Icon(Icons.arrow_back),
  //                       ),
  //                     ),
  //                   ),
  //                   Text(
  //                     "Filter",
  //                     style:
  //                         TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
  //                   ),
  //                   Text(
  //                     "Filter",
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.w600,
  //                         fontSize: 22,
  //                         color: Colors.white),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: 30),
  //               Container(
  //                 width: 240,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10),
  //                     color: Colors.white,
  //                     boxShadow: [
  //                       BoxShadow(
  //                           color: Colors.black.withOpacity(0.4), blurRadius: 4)
  //                     ]),
  //                 child: Padding(
  //                   padding:
  //                       const EdgeInsets.only(left: 15, right: 15, top: 15),
  //                   child: Column(
  //                     children: List.generate(
  //                         controller.list.length,
  //                         (index) => Column(
  //                               children: [
  //                                 Row(
  //                                   children: [
  //                                     InkWell(
  //                                       onTap: () {
  //                                         controller.fillIndex = index;
  //                                         setState(() {});
  //                                       },
  //                                       child: controller.fillIndex == index
  //                                           ? Icon(
  //                                               Icons.check_box_rounded,
  //                                               size: 27,
  //                                               color: Colors.black38,
  //                                             )
  //                                           : Icon(
  //                                               Icons.check_box_outline_blank,
  //                                               size: 27,
  //                                               color: Colors.black38,
  //                                             ),
  //                                     ),
  //                                     SizedBox(width: 15),
  //                                     Text(
  //                                       controller.list[index],
  //                                       style: TextStyle(
  //                                         fontWeight: FontWeight.w500,
  //                                         fontSize: 18,
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 Divider(thickness: 1.5),
  //                               ],
  //                             )),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 20),
  //               Container(
  //                 width: 240,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10),
  //                     color: Colors.white,
  //                     boxShadow: [
  //                       BoxShadow(
  //                           color: Colors.black.withOpacity(0.4), blurRadius: 4)
  //                     ]),
  //                 child: Padding(
  //                   padding:
  //                       const EdgeInsets.only(top: 10, bottom: 10, left: 5),
  //                   child: Wrap(
  //                     children: controller.colorDataList
  //                         .asMap()
  //                         .map((index, value) => MapEntry(
  //                             index,
  //                             InkWell(
  //                               onTap: () {
  //                                 controller.selectIndex = index;
  //                                 // controller.selectIndex = value.id;
  //                                 controller.id = value.id;
  //                                 // print("=======${controller.id}");
  //                                 setState(() {});
  //                                 // print("=");
  //                               },
  //                               child: Container(
  //                                 margin: const EdgeInsets.all(3),
  //                                 height: 17,
  //                                 width: 17,
  //                                 decoration: BoxDecoration(
  //                                   color: Color(
  //                                       int.parse("0xff${value.colorCode}")),
  //                                 ),
  //                                 child: controller.selectIndex == index
  //                                     ? Center(
  //                                         child: Icon(Icons.done,
  //                                             color: Colors.white, size: 12),
  //                                       )
  //                                     : Container(),
  //                               ),
  //                             )))
  //                         .values
  //                         .toList(),
  //                   ),
  //                 ),
  //               ),
  //               // Image.asset(
  //               //   AppAssets.colorImage,
  //               //   fit: BoxFit.cover,
  //               // ),
  //               SizedBox(height: 30),
  //               GestureDetector(
  //                 onTap: () async {
  //                   EasyLoading.show();
  //                   final response = await controller.fitter(
  //                     controller.fillIndex == null
  //                         ? "0"
  //                         : controller.fillIndex.toString(),
  //                     controller.id == null ? "0" : controller.id.toString(),
  //                   );
  //                   EasyLoading.dismiss();
  //                   response.when(
  //                     success: (data) {
  //                       Get.toNamed(SelectFilter.routeName);
  //                     },
  //                     failure: (ErrorType type, String? message) {
  //                       showToast(getMessageFromErrorType(type), Colors.red);
  //                     },
  //                   );
  //                 },
  //                 child: Container(
  //                   height: 50,
  //                   width: 240,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10),
  //                     color: AppColor.kIndigo,
  //                   ),
  //                   child: Center(
  //                     child: Text(
  //                       "Apply",
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w600,
  //                           fontSize: 22,
  //                           color: Colors.white),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 20),
  //               GestureDetector(
  //                 onTap: () {
  //                   controller.fillIndex = null;
  //                   controller.selectIndex = null;
  //                   Get.back();
  //                 },
  //                 child: Container(
  //                   height: 47,
  //                   width: 240,
  //                   decoration: BoxDecoration(
  //                     border: Border.all(color: AppColor.kIndigo),
  //                     borderRadius: BorderRadius.circular(10),
  //                     color: Colors.white,
  //                   ),
  //                   child: Center(
  //                     child: Text(
  //                       "Clear",
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.w600,
  //                         fontSize: 22,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
