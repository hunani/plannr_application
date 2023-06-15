import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AppImagePicker {
  ImagePicker imagePicker = ImagePicker();
  String? tag;
  late ImagePickerController _imagePickerController;
  ImagePickerController get imagePickerController =>
      Get.find<ImagePickerController>(tag: tag);

  AppImagePicker({this.tag}) {
    _imagePickerController = Get.put(ImagePickerController(tag: tag), tag: tag);
  }

  update() {
    _imagePickerController.update();
  }

  Future browseImage(ImageSource imageSource) async {
    try {
      var pickedFile =
          await imagePicker.pickImage(source: imageSource, imageQuality: 50);
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
        ],
      );
      print("==========> ${croppedFile!.path}");
      imagePickerController.image = File(croppedFile.path);
      imagePickerController.update();
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<void> openBottomSheet() async {
    if (Platform.isIOS) {
      await showCupertinoModalPopup<void>(
        context: Get.context as BuildContext,
        builder: (BuildContext context) => CupertinoActionSheet(
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
                child: const Text(
                  'Camera',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  await browseImage(ImageSource.camera).catchError((e) async {
                    await openAppSettings();
                  });
                  Get.back();
                }),
            CupertinoActionSheetAction(
              child: const Text(
                'Gallery',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                await browseImage(ImageSource.gallery);
                Get.back();
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      );
    } else {
      await Get.bottomSheet(
        Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Photo Library'),
              tileColor: Colors.white,
              onTap: () async {
                await browseImage(ImageSource.gallery);
                Get.back();
              },
            ),
            const Divider(
              height: 0.5,
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Camera'),
              tileColor: Colors.white,
              onTap: () async {
                final cameraPermissionStatus = await Permission.camera.status;
                if (cameraPermissionStatus.isDenied) {
                  Permission.camera.request().then((value) async {
                    if (value.isPermanentlyDenied) {
                      await openAppSettings();
                    } else if (value.isDenied) {
                      Permission.camera.request();
                    } else if (value.isGranted) {
                      await browseImage(ImageSource.camera);
                    }
                  });
                } else if (cameraPermissionStatus.isRestricted) {
                  await openAppSettings();
                } else if (cameraPermissionStatus.isGranted) {
                  await browseImage(ImageSource.camera);
                }
                Get.back();
              },
            ),
          ],
        ),
        barrierColor: Colors.black.withOpacity(0.3),
      );
    }
  }
}

class ImagePickerController extends GetxController {
  // setImage(String url) async {
  //   if (url != "") {
  //     _image = await urlToFile(imageUrl + url);
  //     debugPrint("ImagePickerController SET IMAGE $tag");
  //     update();
  //   }
  // }

  String? tag;
  File? _image;
  File? get image => _image;
  set image(File? value) {
    _image = value;
    update();
  }

  void resetImage() {
    image = null;
    update();
  }

  ImagePickerController({this.tag});
}
