import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/app_icon.dart';
import 'package:plannr_app/ui/screen/dashboad/dashboad_screen.dart';

void paymentBottomSheet3() async {
  Get.bottomSheet(
    const PaymentBottomSheet3(),
    backgroundColor: Colors.white,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
    ),
  );
}

class PaymentBottomSheet3 extends StatelessWidget {
  const PaymentBottomSheet3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        Center(
          child: Text(
            "Thank You!",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
          ),
        ),
        SizedBox(height: 50),
        Image.asset(AppAssets.doneImage, height: 200),
        SizedBox(height: 100),
        GestureDetector(
          onTap: () {
            Get.offAllNamed(DashboadScreen.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.kTextColor,
              ),
              child: Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
