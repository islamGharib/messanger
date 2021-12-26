import 'package:flutter/material.dart';
import 'package:messanger_app/shared/styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  Color backgroundColor = defaultColor,
  bool isUpper = true,
  double radius = 0.0,
  required void Function()? buttonPressed,
  required String text ,

}) => Container(
  width: width,
  child: MaterialButton(
    onPressed: buttonPressed,
    child: Text(
      isUpper?text.toUpperCase():text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: backgroundColor,
  ),
);

Widget defaultTextButton({
  required void Function()? func,
  required String text ,
}) => TextButton(
  onPressed: func,
  child: Text(text.toUpperCase()),
);

// Text Form Field
Widget defaultTextFormField(
    {
      required final TextEditingController? controller,
      required TextInputType type,
      required  String? Function(String?)? validate,
      required String label,
      required IconData prefix,
      bool isPassword = false,
      IconData? suffix,
      Function()? suffixPressed,
      Function()? onTap,
      Function(String)? onChange,
      Function(String)? onSubmit,

    }) => TextFormField(
    controller: controller,
    keyboardType: type,
    validator: validate,
    obscureText: isPassword,
    onTap: onTap,
    onChanged: onChange,
    onFieldSubmitted: onSubmit,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(
          prefix
      ),
      suffixIcon: suffix != null?IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix,)):null,
      border: OutlineInputBorder(),
    )
);
