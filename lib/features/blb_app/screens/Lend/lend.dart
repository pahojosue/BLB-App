import 'dart:io';

import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/images/blb_rounded_image.dart';
import 'package:blb/data/repositories/item/item_repository.dart';
import 'package:blb/features/blb_app/controllers/items/item_controller.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LendScreen extends StatelessWidget {
  const LendScreen({super.key});
  static const List<String> _itemState = ['New', 'Fairly Used', 'Used'];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItemController());
    controller.cleanScreen();
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Scaffold(
        body: Center(
          child: Text(
            BLBTexts.loginRequired,
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: BLBAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(BLBSizes.defaultSpace),
            child: Form(
              key: controller.itemFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Image Picker
                  Obx(() {
                    final networkImage = controller.imageUrl.value;
                    final image =
                        networkImage.isNotEmpty ? networkImage : BLBImages.user;
                    return BLBRoundedImage(
                      height: 200,
                      width: BLBHelperFunctions.screenWidth(),
                      imageUrl: image,
                    );
                  }),
                  const SizedBox(height: BLBSizes.spaceBtwItems),
                  //Imagepicker button
                  Row(
                    children: [
                      //Pick from gallery
                      Buttons(
                          text: "Gallery",
                          onPressed: () async {
                            _pickImageGallery(controller);
                          }),
                      SizedBox(width: BLBSizes.spaceBtwItems * 8),
                      //Chose from camera
                      Buttons(
                          text: "Camera",
                          onPressed: () async {
                            _pickImageCamera(controller);
                          }),
                    ],
                  ),
                  const SizedBox(height: BLBSizes.spaceBtwItems),
                  //Item Name
                  FormField(text: "Name", controller: controller.name),
                  const SizedBox(height: BLBSizes.spaceBtwInputFields),
                  //Item description
                  FormField(
                      text: "Description", controller: controller.description),
                  const SizedBox(height: BLBSizes.spaceBtwInputFields),
                  //Price
                  FormField(
                      text: "Price",
                      suffix: "XAF",
                      controller: controller.price),
                  const SizedBox(height: BLBSizes.spaceBtwInputFields),
                  //State
                  DropDowns(state: _itemState, controller: controller),
                  const SizedBox(height: BLBSizes.spaceBtwInputFields),
                  //Lending Period
                  FormField(
                      text: "Lending Period",
                      suffix: "day(s)",
                      controller: controller.lendingPeriod),
                  const SizedBox(height: BLBSizes.spaceBtwInputFields),
                  //Allow for bartering or not
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Obx(() => Checkbox(
                            value: controller.canBeBartered.value,
                            onChanged: (value) => controller.canBeBartered
                                .value = !controller.canBeBartered.value)),
                      ),
                      const SizedBox(width: BLBSizes.spaceBtwItems),
                      Text("Allow for Bartering",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: BLBSizes.defaultSpace))
                    ],
                  ),
                  const SizedBox(height: BLBSizes.spaceBtwSections),
                  //Buttons
                  Row(
                    children: [
                      //Cancel Button
                      Buttons(text: "Cancel", onPressed: () {}),
                      SizedBox(width: BLBSizes.spaceBtwItems * 8),
                      //Save Button
                      Buttons(
                          text: "Save",
                          onPressed: () => controller.sendItemDetails()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Future<void> _pickImageGallery(ItemController controller) async {
    final repository = Get.put(ItemRepository());
    String imageUrl = '';
    File? imageFile;
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512);
    if (image != null) {
      imageFile = File(image.path);
      imageUrl = await repository.uploadImage(imageFile);
      controller.setImageUrl(imageUrl);
    }
  }

  Future<void> _pickImageCamera(ItemController controller) async {
    final repository = Get.put(ItemRepository());
    String imageUrl = '';
    File? imageFile;
    final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512);
    if (image != null) {
      imageFile = File(image.path);
      imageUrl = await repository.uploadImage(imageFile);
      controller.setImageUrl(imageUrl);
    }
  }
}

class DropDowns extends StatelessWidget {
  const DropDowns({
    super.key,
    required List<String> state,
    required this.controller,
  }) : _state = state;

  final List<String> _state;
  final ItemController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: Text("State",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: BLBSizes.defaultSpace)),
        ),
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: "State of your item",
              border: OutlineInputBorder(),
            ),
            items: _state.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              controller.setState(value!);
            },
          ),
        ),
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: BLBSizes.defaultSpace * 6,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(53, 237, 237, 1),
                side: BorderSide(color: Color.fromRGBO(53, 237, 237, 1))),
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
            )));
  }
}

class FormField extends StatelessWidget {
  const FormField({
    super.key,
    required this.text,
    this.suffix = "",
    required this.controller,
  });

  final String text;
  final String suffix;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: BLBSizes.defaultSpace)),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              suffix: Text(suffix),
            ),
          ),
        ),
      ],
    );
  }
}
