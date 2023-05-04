import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/app_icon.dart';

import 'bottom_sheet2.dart';

void paymentBottomSheet() async {
  Get.bottomSheet(
    const PaymentBottomSheet(),
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

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        Text(
          "Google Pay",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        SizedBox(height: 5),
        Divider(thickness: 2),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(AppAssets.logoBox, height: 55),
                  SizedBox(width: 20),
                  Text(
                    "Planner - Yearly",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "1- year access",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Spacer(),
                  Text(
                    "\$159.99",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "See include tax",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 13),
                    child:
                        CircleAvatar(radius: 2, backgroundColor: Colors.black),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "You’re purchasing 1 year of access , which expires on Mar 21, 2024",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  CircleAvatar(radius: 2, backgroundColor: Colors.black),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "This subscription will not automatically renew",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Divider(thickness: 2),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "By tapping “Buy” , you accept the folloeing google payments terms of services : Terms of Services - Buyer (india), Privacy Notice. ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            paymentBottomSheet2();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.kIndigo,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Buy",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
