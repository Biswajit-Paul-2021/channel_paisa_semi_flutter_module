import 'package:channel_paisa_semi_flutter_module/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscribeButton extends StatelessWidget {
  const SubscribeButton({
    Key key,
    this.onTap,
    this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.workSans(
            textStyle: TextStyle(
              color: AppColors.primaryDarkColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
