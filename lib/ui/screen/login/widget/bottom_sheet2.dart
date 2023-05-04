import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/app_icon.dart';
import 'package:plannr_app/const/dispose_keyboard.dart';

import 'bottom_sheet3.dart';

void paymentBottomSheet2() async {
  Get.bottomSheet(
    const PaymentBottomSheet2(),
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

class PaymentBottomSheet2 extends StatefulWidget {
  const PaymentBottomSheet2({Key? key}) : super(key: key);

  @override
  State<PaymentBottomSheet2> createState() => _PaymentBottomSheet2State();
}

class _PaymentBottomSheet2State extends State<PaymentBottomSheet2> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
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
            Text(
              "Enter Card Number",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black54),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: cardNumberController,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              ),
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.phone,
              validator: (val) => val!.trim().isEmpty ? "field required" : null,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.kIndigo)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.kIndigo)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.kIndigo),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintStyle: TextStyle(color: Colors.black38),
                fillColor: Colors.transparent,
                filled: true,
                contentPadding: const EdgeInsets.only(top: 20, left: 15),
                hintText: "Card Number",
                suffixIcon: Icon(Icons.credit_card),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Enter Card Number",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black54),
                ),
                Spacer(),
                Text(
                  "Cvv number",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
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
                          borderSide: BorderSide(color: AppColor.kIndigo)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.kIndigo)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.kIndigo),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: TextStyle(color: Colors.black38),
                      fillColor: Colors.transparent,
                      filled: true,
                      contentPadding: const EdgeInsets.only(top: 20, left: 15),
                      hintText: "Event Date",
                      suffixIcon: Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: TextFormField(
                    controller: cvvController,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.phone,
                    validator: (val) =>
                        val!.trim().isEmpty ? "field required" : null,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.kIndigo)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.kIndigo)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.kIndigo),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: TextStyle(color: Colors.black38),
                      fillColor: Colors.transparent,
                      filled: true,
                      contentPadding: const EdgeInsets.only(top: 20, left: 15),
                      hintText: "Cvv Number",
                      suffixIcon: Icon(Icons.error_outline),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Enter Card holder name",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black54),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: cardController,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              ),
              textAlignVertical: TextAlignVertical.center,
              validator: (val) => val!.trim().isEmpty ? "field required" : null,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.kIndigo)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.kIndigo)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.kIndigo),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintStyle: TextStyle(color: Colors.black38),
                fillColor: Colors.transparent,
                filled: true,
                contentPadding: const EdgeInsets.only(top: 20, left: 15),
                hintText: "Enter card holder’s full name",
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "OR",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.googlePay, height: 60),
                SizedBox(width: 20),
                Image.asset(AppAssets.apply, height: 70),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                paymentBottomSheet3();
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.kIndigo,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Pay",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
