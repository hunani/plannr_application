import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/app_icon.dart';
import 'package:http/http.dart' as http;

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

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({Key? key}) : super(key: key);

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "Google Pay",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Spacer(),
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(AppAssets.remove, height: 17)),
            ],
          ),
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
          onTap: () async {
            Navigator.pop(context);
            await makePayment();
            // await makePayment1();
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

//   Future<void> makePayment() async {
//     try {
//       paymentIntentData = await createPaymentIntent('20', 'USD');
//       await Stripe.instance
//           .initPaymentSheet(
//               paymentSheetParameters: SetupPaymentSheetParameters(
//             paymentIntentClientSecret:
//                 paymentIntentData != null ? ['client_secret'].join('') : null,
//             style: ThemeMode.light,
//             merchantDisplayName: 'John',
//           ))
//           .then((value) {});
//
//       await displayPaymentSheet();
//     } catch (e) {
//       if (kDebugMode) {
//         print(e.toString());
//       }
//     }
//   }
//
//   displayPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet().then((newValue) {
//         if (kDebugMode) {
//           print('payment intent${paymentIntentData!['id']}');
//         }
//         print('payment intent${paymentIntentData!['client_secret']}');
//         print('payment intent${paymentIntentData!['amount']}');
//         print('payment intent$paymentIntentData');
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             content: Text("Congratulation you have buy 20 Credits")));
//
//         paymentIntentData = null;
//       }).onError((error, stackTrace) {
//         if (kDebugMode) {
//           print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
//         }
//       });
//     } on StripeException catch (e) {
//       if (kDebugMode) {
//         print('Exception/DISPLAYPAYMENTSHEET==> $e');
//       }
//       showDialog(
//           context: context,
//           builder: (_) => const AlertDialog(
//                 content: Text("Cancelled "),
//               ));
//     } catch (e) {
//       print('$e');
//     }
//   }
//
//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//         'payment_method_types[]': 'card'
//       };
//       var response = await http.post(
//           Uri.parse('https://api.stripe.com/v1/payment_intents'),
//           body: body,
//           headers: {
//             'Authorization':
//                 'Bearer sk_test_51Nk4M8SJz8uuZyT3nKuhi3RFeugYMTHSkTdD7wf2lsLsqCHVZyDZxKGC6MKnuMk4KWRVx8ptJ7AjyXeTZTAzIqX300AwMc760v',
//             'Content-Type': 'application/x-www-form-urlencoded'
//           });
//
//       return jsonDecode(response.body.toString());
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   calculateAmount(String amount) {
//     final price = int.parse(amount) * 100;
//     return price.toString();
//   }
// }
  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent();
      // var gpay = const PaymentSheetGooglePay(
      //     merchantCountryCode: "US", currencyCode: "usd", testEnv: true);

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!["client_secret"],
          merchantDisplayName: "ASIF",
          // googlePay: gpay,
          style: ThemeMode.dark,
        ),
      );

      // print("===========> hello");

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
  }

  createPaymentIntent() async {
    try {
      Map<String, dynamic> body = {
        'amount': "1000",
        'currency': "USD",
        // 'payment_method_types': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51Nk4M8SJz8uuZyT3nKuhi3RFeugYMTHSkTdD7wf2lsLsqCHVZyDZxKGC6MKnuMk4KWRVx8ptJ7AjyXeTZTAzIqX300AwMc760v',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print("===============> mm1 ${response.body}");
      return jsonDecode(response.body.toString());
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) {
        print('payment intent${paymentIntentData!['id']}');
        print(
            'payment intent${paymentIntentData!['sk_test_51Nk4M8SJz8uuZyT3nKuhi3RFeugYMTHSkTdD7wf2lsLsqCHVZyDZxKGC6MKnuMk4KWRVx8ptJ7AjyXeTZTAzIqX300AwMc760v']}');
        print('payment intent${paymentIntentData!['amount']}');
        print('payment intent$paymentIntentData');
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("paid successfully")));

        // paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled"),
              ));
    } catch (e) {
      print('================> $e');
    }
  }

  calculateAmount(String amount) {
    final prince = (int.parse(amount)) * 100;
    return prince.toString();
  }

  // createPaymentIntent1() async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': "1000",
  //       'currency': "USD",
  //     };
  //     http.Response response = await http.post(
  //         Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //         body: body,
  //         headers: {
  //           'Authorization':
  //               'Bearer sk_test_51Nk4M8SJz8uuZyT3nKuhi3RFeugYMTHSkTdD7wf2lsLsqCHVZyDZxKGC6MKnuMk4KWRVx8ptJ7AjyXeTZTAzIqX300AwMc760v',
  //           'Content-Type': 'application/x-www-form-urlencoded'
  //         });
  //     print("===============> mm1 ${response.body}");
  //     return json.decode(response.toString());
  //   } catch (e) {
  //     throw Exception(e.toString());
  //     // print('err charging user: ${err.toString()}');
  //   }
  // }
  //
  // displayPaymentSheet1() async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet();
  //     print("Done");
  //   } catch (e) {
  //     print('Failed');
  //   }
  // }
  //
  // Future<void> makePayment1() async {
  //   try {
  //     paymentIntentData = await createPaymentIntent1();
  //     var gpay = const PaymentSheetGooglePay(
  //         merchantCountryCode: "US", currencyCode: "usd", testEnv: true);
  //
  //     await Stripe.instance.initPaymentSheet(
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //             paymentIntentClientSecret: paymentIntentData!["client_secret"],
  //             merchantDisplayName: "Sabir",
  //             googlePay: gpay,
  //             style: ThemeMode.dark));
  //
  //     ///now finally display payment sheeet
  //     displayPaymentSheet1();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
