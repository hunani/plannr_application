import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/categories/controller/categories_controller.dart';
import 'package:plannr_app/ui/screen/categories/screen/upload_screen.dart';
import '../../../../const/app_icon.dart';
import '../../../../const/dispose_keyboard.dart';
import '../../../../widget/image_picker.dart';
import 'view_categories_screen.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/categoriesScreen';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesController categoriesController = Get.find<CategoriesController>();
  ImagePickerController imagePickerController =
      Get.find<ImagePickerController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: RefreshIndicator(
        onRefresh: () async {
          categoriesController.categoriesData();
        },
        child: Scaffold(
          backgroundColor: AppColor.kScreenColor,
          body: GetBuilder(
            builder: (CategoriesController controller) {
              if (controller.isLoading) {
                return Container();
              }
              return SafeArea(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        Container(
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
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        BorderSide(color: AppColor.kIndigo)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        BorderSide(color: AppColor.kIndigo)),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.kIndigo),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintStyle: TextStyle(color: Colors.black38),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.only(top: 20, left: 15),
                                hintText: "Search Categories",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Image.asset(
                                    AppAssets.searchImage,
                                    height: 20,
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(height: 20),
                        ...controller.categoriesDataList
                            .asMap()
                            .map((index, value) => MapEntry(
                                index,
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            ViewCategoriesScreen.routeName,
                                            arguments: CategoriesModel2(
                                                value.id, value.name));
                                        print("=ewfrewfew===========>");
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10, top: 10),
                                              child: Container(
                                                height: 65,
                                                width: 65,
                                                decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                      value.imagePath,
                                                      fit: BoxFit.cover),
                                                  // child: Image.asset(
                                                  //     AppAssets.homeImage2,
                                                  //     fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 15),
                                            Text(
                                              value.name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                            Spacer(),
                                            Icon(Icons.add, size: 30),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                        thickness: 1, color: Colors.black38),
                                  ],
                                )))
                            .values
                            .toList(),
                        SizedBox(height: 35),
                        GestureDetector(
                            onTap: () {
                              Get.toNamed(UploadScreen.routeName);
                            },
                            child: Image.asset(AppAssets.homeImage4)),
                        SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CategoriesModel2 {
  final int id;
  final String name;

  const CategoriesModel2(this.id, this.name);
}
