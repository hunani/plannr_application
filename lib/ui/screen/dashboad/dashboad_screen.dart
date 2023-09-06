import 'package:flutter/material.dart';
import 'package:plannr_app/const/app_icon.dart';
import 'package:plannr_app/ui/screen/categories/screen/categories_screen.dart';
import 'package:plannr_app/ui/screen/events/events_page.dart';
import 'package:plannr_app/ui/screen/home/home_screen.dart';
import 'package:plannr_app/ui/screen/profile/profile_screen.dart';

class DashboadScreen extends StatefulWidget {
  static const String routeName = '/dashboadScreen';
  const DashboadScreen({Key? key}) : super(key: key);

  @override
  State<DashboadScreen> createState() => _DashboadScreenState();
}

class _DashboadScreenState extends State<DashboadScreen> {
  int selectedIndex = 0;
  List<BottomTabModel> list = [
    BottomTabModel(AppAssets.homeImage, "Home"),
    BottomTabModel(AppAssets.categoriesImage, "Categories"),
    BottomTabModel(AppAssets.eventsImage, "Events"),
    BottomTabModel(AppAssets.profileImage, "Profile"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          HomeScreen(),
          CategoriesScreen(),
          EventsScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...list
                  .asMap()
                  .map((index, value) => MapEntry(
                        index,
                        GestureDetector(
                          onTap: () {
                            selectedIndex = index;
                            setState(() {});
                          },
                          child: Container(
                            width: 70,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Image.asset(value.icon,
                                    height: 23,
                                    color: selectedIndex == index
                                        ? Color(0xff000000)
                                        : Colors.black38),
                                SizedBox(height: 5),
                                Text(value.label,
                                    style: TextStyle(
                                      color: selectedIndex == index
                                          ? Color(0xff000000)
                                          : Colors.black38,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ))
                  .values
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

// GestureDetector(
// onTap: () {
// selectedIndex = index;
// setState(() {});
// },
// child: Column(
// children: [
// Image.asset(value.icon,
// height: 23,
// color: selectedIndex == index
// ? Color(0xff000000)
// : Colors.black38),
// SizedBox(height: 5),
// Text(value.label,
// style: TextStyle(
// color: selectedIndex == index
// ? Color(0xff000000)
// : Colors.black38,
// )),
// ],
// ),
// )

class BottomTabModel {
  final String label;
  final String icon;

  const BottomTabModel(this.icon, this.label);
}
