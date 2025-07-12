import 'package:flutter/material.dart';
import 'package:todo_app/core/util/color.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String? value)? validator;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLines: maxLines,
      controller: controller,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'poppins',
        fontSize: 18,
      ),

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        fillColor: AppColor.surface,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'poppins',
          color: Color(0xff6D6D6D),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
    // TextFormField(
    //                         controller: desController,
    //                         cursorColor: Colors.white,
    //                         style: TextStyle(
    //                           color: Colors.white,
    //                           fontFamily: 'poppins',
    //                           fontSize: 18,
    //                         ),
    //                         maxLines: 5,
    //                         decoration: InputDecoration(
    //                           contentPadding: EdgeInsets.symmetric(
    //                             horizontal: 16,
    //                             vertical: 16,
    //                           ),
    //                           border: OutlineInputBorder(
    //                             borderRadius: BorderRadius.circular(16),
    //                             borderSide: BorderSide.none,
    //                           ),
    //                           fillColor: AppColor.surface,
    //                           filled: true,
    //                           hintText:
    //                               "From Data Structure Course at Next Friday.",
    //                           hintStyle: TextStyle(
    //                             fontFamily: 'poppins',
    //                             color: Color(0xff6D6D6D),
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.w400,
    //                           ),
    //                         ),
    //                       ),