import "package:another_flushbar/flushbar.dart";
import "package:another_flushbar/flushbar_route.dart";
import "package:fluttertoast/fluttertoast.dart";
import "package:flutter/material.dart";

class Utils {
  // flutter toast
  static toastMessage() {
    Fluttertoast.showToast(
      msg: "No Internet Connection",
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 10,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  // flush bar
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        borderRadius: BorderRadius.circular(20),
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(Icons.error, size: 28, color: Colors.white),
      )..show(context),
    );
  }

  // snack bar default flutter toast
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  // field focus change
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
