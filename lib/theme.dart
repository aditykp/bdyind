import 'package:flutter/material.dart';

double defaultRadius = 15.0;
double defaultMargin = 30.0;

Color backgroundColor1 = const Color(0xff171413);
Color backgroundColor2 = const Color(0xFF242527);
Color whiteColor = const Color(0xFFffffff);
Color greyColor = const Color(0xffB8C6CD);
Color darkGreyColor = const Color(0xff605A57);
Color brownColor = const Color(0xffF9D923);
Color transparentColor = Colors.transparent;
Color orangeColor = const Color(0xffF9D923);
Color yellowColor = const Color(0xffFF8D29);

TextStyle whiteTextStyle = TextStyle(fontFamily: 'Poppins', color: whiteColor);
TextStyle greyTextStyle = TextStyle(fontFamily: 'Poppins', color: greyColor);
TextStyle darkGreyTextStyle =
    TextStyle(fontFamily: 'Poppins', color: darkGreyColor);
TextStyle brownTextStyle = TextStyle(fontFamily: 'Poppins', color: brownColor);
TextStyle orangeTextStyle =
    TextStyle(fontFamily: 'Poppins', color: orangeColor);
TextStyle yellowTextStyle =
    TextStyle(fontFamily: 'Poppins', color: yellowColor);

FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;

Size displaySize(BuildContext context) => MediaQuery.of(context).size;
double displayHeight(BuildContext context) => displaySize(context).height;
double displayWidth(BuildContext context) => displaySize(context).width;

const kDefaultPaddin = 20.0;
