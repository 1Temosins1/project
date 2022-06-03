import 'package:flutter/material.dart';

Widget defaultButton({
  double width =double.infinity,
  bool isUpperCase = true,
  double radius=20.0,
  double hieght=40.0,
  fontWeight: FontWeight.bold,
  Color background=Colors.blue,
  color:   Colors.white,
  font: 20.0,

  @required function,
  @required text,
}) =>
    Container(

      height: hieght,
      width:width,
      child: MaterialButton(
    onPressed:function,
    child: Text(
      isUpperCase ?  text.toUpperCase() : text,
      style: TextStyle(
        fontSize:font,
        color: color,
          fontWeight: fontWeight,

      ),
    ),

  ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            radius,
        ),
        color:background ,

      ),
);

Widget defaultFormField({
  @required controller,
  @required type,
  onSubmit,
  onChange,
  bool isPassword= false,
  @required validate,
  @required  label,
  helper,
  hint,
  maxl=1,
  @required  prefix,
  suffix,
  suffixPressed,
}) => TextFormField(
      controller: controller,
      keyboardType:type,
      maxLines: maxl,
      obscureText: isPassword,
       onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      decoration: InputDecoration(
        labelText:label,
        helperText: helper,
        hintText: hint,
        prefixIcon:Icon(
        prefix,
        ),
        suffixIcon:suffix != null? IconButton(
          onPressed:suffixPressed ,
            icon:Icon(
              suffix,),
        ):null,
        border:  OutlineInputBorder(),
      ),
    );