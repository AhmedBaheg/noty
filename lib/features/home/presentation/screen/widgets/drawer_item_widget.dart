import 'package:flutter/material.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/core/utils/app_text_styles.dart';

class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget({super.key,
    required this.icon,
    required this.title,
    required this.selected,
    required this.onTap,
    this.count, required this.selectedIndex,
  });

  final IconData icon;
  final String title;
  final String? count;
  final bool selected, selectedIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),

        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 180,
          ),

          height: 44,

          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),

          decoration: BoxDecoration(
            color: selected
                ? AppColors.selectedSurface
                : Colors.transparent,

            borderRadius: BorderRadius.circular(10),
          ),

          child: Row(
            children: [
              // Icon
              Icon(
                icon,
                size: 20,
                color: selected
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
              ),

              const SizedBox(width: 14),

              // Title
              Expanded(
                child: Text(
                  title,
                  style: selected
                      ? AppTextStyles.drawerSelectedItem
                      : AppTextStyles.drawerItem,
                ),
              ),

              // Count
              if (count != null)
                Text(
                  count!,
                  style: AppTextStyles.drawerCount,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
