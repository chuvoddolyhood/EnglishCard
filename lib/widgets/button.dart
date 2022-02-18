import 'package:englishcard/values/app_colors.dart';
import 'package:englishcard/values/app_styles.dart';
import 'package:flutter/material.dart';

class appButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const appButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //Event
      onTap: () {
        onTap();
      },

      //Design
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        margin: EdgeInsets.all(24),
        child: Text(
          label,
          style: appStyles.h5.copyWith(color: appColors.textColor),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                  color: appColors.blackGrey,
                  offset: Offset(3, 6),
                  blurRadius: 10)
            ]),
      ),
    );
  }
}
