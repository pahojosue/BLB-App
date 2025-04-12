import 'package:blb/common/widgets/appbar/appbar.dart';
import 'package:blb/features/authentication/screens/profile/update_name_controller.dart';
import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:blb/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget{
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(

      /// Custom AppBar
      appBar: BLBAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(BLBSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -- Heading
             Text(
              'Use real name for easy verification. This name will appear on several pages.', 
              style: Theme.of(context).textTheme.labelMedium,
              ),
            const SizedBox(height: BLBSizes.spaceBtwSections),

            ///Text field and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => BLBValidator.validateEmptyText('First name', value), 
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: BLBTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: BLBSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => BLBValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: BLBTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
                    )),
                      
                    const SizedBox(height: BLBSizes.spaceBtwSections),

                    /// Save Button
                   
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save')),
                  ),
                  
                ],
              ),
            ),
    );
  }
}