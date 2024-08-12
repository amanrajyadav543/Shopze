import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGradient extends StatelessWidget {
  final Widget child;
  const CustomGradient({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).cardColor, // Start color
            Theme.of(context).backgroundColor // Start color
          ],
        ),
      ),
      child: child,
    );
  }
}
