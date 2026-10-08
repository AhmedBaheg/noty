import 'package:flutter/material.dart';
import 'package:my_note/core/utils/app_text_styles.dart';

class DrawerSectionItemWidget extends StatelessWidget {
  const DrawerSectionItemWidget({super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),
      child: Text(
        title,
        style: AppTextStyles.drawerSectionTitle,
      ),
    );
  }
}
