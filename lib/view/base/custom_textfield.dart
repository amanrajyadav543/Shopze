import 'package:flutter/material.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  final bool isPassword;
  final String title;
  final FocusNode? focusNode;
  final TextInputType inputType;
  final bool showPassword;
  final TextEditingController? controller;
  final String hintText;
  final TextInputAction inputAction;
  final Color? textColor;
  final bool isEnabled;
  final double height;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double radius;
  final bool required;
  final bool titleRequired;
  final bool color ;

  const CustomTextField(
      {required this.title,
        this.color  = false,
        required this.hintText,
        this.radius = 30,
        this.isPassword = false,
        this.showPassword = false,
        this.inputType = TextInputType.text,
        this.inputAction = TextInputAction.next,
        this.controller,
        this.textColor,
        this.isEnabled = true,
        super.key,
        this.focusNode,
        this.suffixIcon,
        this.prefixIcon,
        this.height = 50,
        this.maxLines,  this.required = false,  this.titleRequired = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPassVisible = false;

  @override
  void initState() {
    isPassVisible = widget.showPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmallExtra),
      child: Column(
        children: [
          widget.titleRequired ?               SizedBox():
          widget.required ?
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "    "+   widget.title,
                  style: interMedium.copyWith(
                      fontSize: Dimensions.fontSizeSmallOnly,
                      height: 1.4,
                      color: Theme.of(context).disabledColor),
                ),
              ),
              SizedBox(width: 2,),
              Icon(Icons.star_rounded,color: Colors.red,size: Dimensions.fontSizeVerySmall,)
            ],
          ):
          Align(
            alignment: Alignment.topLeft,
            child: Text(
            "    "+   widget.title,
              style: interMedium.copyWith(
                  fontSize: Dimensions.fontSizeSmallOnly,
                  height: 1.4,
                  color: Theme.of(context).disabledColor),
            ),
          ),
          const SizedBox(
            height: Dimensions.radiusSmall,
          ),
          SizedBox(
            height: widget.height,
            child: TextField(
              focusNode: widget.focusNode,
              controller: widget.controller,
              cursorColor: Theme.of(context).primaryColor,
              textInputAction: widget.inputAction,
              style: TextStyle(
                  color: widget.textColor ?? Theme.of(context).hintColor),
              enabled: widget.isEnabled,
              maxLines: widget.maxLines,
              decoration: InputDecoration(
                fillColor: Theme.of(context).cardColor,
                  filled: true,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, // Add vertical padding
                    horizontal: 12.0, // Add horizontal padding
                  ),
                  prefixIcon: widget.prefixIcon,
                  prefixIconColor: Theme.of(context).focusColor,
                  suffixIcon: widget.suffixIcon,
                  hintText: widget.hintText,
                  hintStyle: interRegular.copyWith(
                      fontSize: Dimensions.fontSizeExtraSmall,
                      color: widget.color ? Theme.of(context).disabledColor:Theme.of(context).hintColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(widget.radius),
                    borderSide:  BorderSide(
                        width: 1, color: Theme.of(context).hintColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(widget.radius),
                    borderSide: BorderSide(
                        width:1, color: Theme.of(context).hintColor),
                  )),
            ),
          )
        ],
      ),
    );
  }
}