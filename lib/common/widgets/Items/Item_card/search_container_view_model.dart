import 'package:blb/utils/constants/sizes.dart';
import 'package:blb/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainerModel {
  final IconData? icon;
  final String title;
  final bool showBackground, showBorder;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;
  SearchContainerModel({
    this.padding = const EdgeInsets.symmetric(horizontal: BLBSizes.defaultSpace),
    this.onPressed,
    this.icon = Iconsax.search_normal,
    this.title = BLBTexts.searchContainer,
    this.showBackground = true,
    this.showBorder = true,
  });
}
