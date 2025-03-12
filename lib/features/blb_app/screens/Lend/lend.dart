import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/common/widgets/images/blb_rounded_image.dart';
import 'package:blb/utils/constants/image_strings.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LendScreen extends StatelessWidget {
  const LendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BLBAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BLBSizes.defaultSpace),
          child: Column(
            children: [
              //Image Picker
              BLBRoundedImage(
                imageUrl: BLBImages.user,
                height: 200,
                width: BLBHelperFunctions.screenWidth(),
                backgroundColor: Colors.black,
              ),
              const SizedBox(height: BLBSizes.spaceBtwItems),
              //Imagepicker button
              Row(
                children: [
                  //Pick from gallery
                  Buttons(text: "Gallery", onPressed: () {}),
                  SizedBox(width: BLBSizes.spaceBtwItems * 8),
                  //Chose from camera
                  Buttons(text: "Camera", onPressed: () {}),
                ],
              ),
              const SizedBox(height: BLBSizes.spaceBtwItems),
              //Form
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Item Name
                    FormField(text: "Name"),
                    const SizedBox(height: BLBSizes.spaceBtwInputFields),
                    //Item description
                    FormField(text: "Description"),
                    const SizedBox(height: BLBSizes.spaceBtwInputFields),
                    //Price
                    FormField(text: "Price"),
                    const SizedBox(height: BLBSizes.spaceBtwInputFields),
                    //Allow for bartering or not
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(value: true, onChanged: (value) {}),
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
                        Buttons(text: "Save", onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(53, 237, 237, 1),
                side: BorderSide(color: Color.fromRGBO(53, 237, 237, 1))),
            child: Text(
              text,
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
            )));
  }
}

class FormField extends StatelessWidget {
  const FormField({
    super.key,
    required this.text,
  });

  final String text;
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
          child: TextFormField(),
        ),
      ],
    );
  }
}
