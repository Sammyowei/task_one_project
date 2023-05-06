import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_one_project/constants/app_constants.dart';

class CustomTextField extends ConsumerStatefulWidget {
  final double? height;
  final double? width;
  final String? hintText;
  final String? validator;
  final bool growable;
  final TextEditingController? controller;

  const CustomTextField({
    required this.controller,
    this.growable = true,
    this.validator,
    this.height,
    this.hintText,
    this.width,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  final appConstant = AppConstants();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: appConstant.secondaryColor.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: widget.controller ?? TextEditingController(),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => value!.isEmpty ? widget.validator : null,
        keyboardType: TextInputType.text,
        style: GoogleFonts.nunito(
          color: appConstant.secondaryColorThree,
        ),
        decoration: InputDecoration(
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: appConstant.secondaryColorThree.withOpacity(0.4),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
        ),
        maxLines: widget.growable ? 5 : null,
        cursorColor: appConstant.secondaryColorThree,
      ),
    );
  }
}
