import 'package:flutter/cupertino.dart';
import 'package:moniepoint_test/app/theme/colors.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({required this.icon, super.key});

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: const BoxDecoration(
        color: kDefaultOrange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: icon,
    );
  }
}
