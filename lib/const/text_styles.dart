import 'package:flutter/material.dart';

TextStyle MooliRegular() {
  return TextStyle(
    fontFamily: "Mooli",
    fontWeight: FontWeight.w400,
  );
}

TextStyle Nanum30(double fontSize) {
  return TextStyle(
    fontFamily: "NanumPenScript",
    fontWeight: FontWeight.w400,
    fontSize: fontSize,
  );
}

TextStyle NotoSansKR(FontWeight fontWeight, double fontSize) {
  return TextStyle(
    fontFamily: "NotoSansKR",
    fontWeight: fontWeight,
    fontSize: fontSize,
  );
}
