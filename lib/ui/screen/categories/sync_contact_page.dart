import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:plannr_app/const/app_color.dart';

import '../../../const/app_icon.dart';
import '../../../core/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';
import 'controller/contact_sync_controller.dart';
import 'model/contact_model.dart';

class SyncContactPage extends StatefulWidget {
  static const String routeName = '/syncContactPage';
  const SyncContactPage({Key? key}) : super(key: key);

  @override
  State<SyncContactPage> createState() => _SyncContactPageState();
}

class _SyncContactPageState extends State<SyncContactPage> {
  List<Contact> contacts = [];
  List<ContactsListNameAndNumber> contacts2 = [];
  bool view = false;

  @override
  void initState() {
    super.initState();
    getContactPermission();
  }

  void getContactPermission() async {
    if (await Permission.contacts.isGranted) {
      fetchContacts();
    } else {
      await Permission.contacts.request();
    }
  }

  void fetchContacts() async {
    EasyLoading.show();
    contacts = await ContactsService.getContacts();
    //print("====00==----==> ${contacts.length}");
    for (int i = 0; i < contacts.length; i++) {
      contacts2.add(ContactsListNameAndNumber(
          name: contacts[i].givenName ?? "null",
          number: contacts[i].phones == null
              ? "null"
              : contacts[i].phones == null
                  ? "null"
                  : contacts[i].phones!.isEmpty
                      ? "null"
                      : contacts[i].phones![0].value ?? "null",
          email: contacts[i].emails == null
              ? "0"
              : contacts[i].emails!.isEmpty
                  ? "null"
                  : contacts[i].emails![0].value ?? "null"));
    }
    print("======----==> ${contacts2.length}");
    setState(() {
      view = true;
      showToast("contact fetch", Colors.black);
      EasyLoading.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: GetBuilder(
          builder: (ContactSyncController controller) {
            return Column(
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
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
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
                view == true
                    ? Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.kIndigo),
                            child: Center(
                              child: Text(
                                "SYNC Contact",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Keep your contacts synced with google \ncontacts so you never lose them",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                          SizedBox(height: 60),
                          GestureDetector(
                            onTap: () async {
                              EasyLoading.show();
                              final response =
                                  await controller.sendContacts(contacts2);
                              EasyLoading.dismiss();
                              response.when(
                                success: (data) {
                                  showToast("Contact SYNC Successfully",
                                      Colors.black);
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
                              height: 45,
                              width: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.kIndigo),
                              child: Center(
                                child: Text(
                                  "Contact",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
