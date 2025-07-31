import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgPic extends StatelessWidget {
  final String assetName;
  final bool applyColor;
  final double? width;
  final double? height;
  const CustomSvgPic({
    super.key,
    required this.assetName,
    this.applyColor = true,
    this.width,
    this.height,
  });
  const CustomSvgPic.withoutColor({
    super.key,
    required this.assetName,
    this.width,
    this.height,
  }) : applyColor = false;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,

      width: width,
      height: height,
      colorFilter:
          applyColor
              ? ColorFilter.mode(
                Theme.of(context).primaryColorDark,
                BlendMode.srcIn,
              )
              : null,
    );
  }
}
