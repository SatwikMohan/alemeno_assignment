import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void NavigateTo(BuildContext context, Widget widget){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ),
  );
}

void NavigateToWithoutLookBack(BuildContext context, Widget widget){
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false,
  );
}