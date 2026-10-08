import 'package:flutter/material.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/core/utils/app_text_styles.dart';

class DrawerCategoryItemWidget extends StatelessWidget {
  const DrawerCategoryItemWidget({super.key,
    required this.title,
    required this.count,
    required this.color,
    required this.selected,
    required this.onTap, required this.selectedIndex,
  });

  final String title;
  final String count;
  final Color color;
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

          height: 42,

          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),

          decoration: BoxDecoration(
            color: selected
                ? AppColors.selectedSurface
                : Colors.transparent,

            borderRadius: BorderRadius.circular(10),
          ),

          child: Row(
            children: [
              // Category Color
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 180,
                ),

                width: selected ? 12 : 10,
                height: selected ? 12 : 10,

                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),

              const SizedBox(width: 15),

              // Category Name
              Expanded(
                child: Text(
                  title,
                  style: selected
                      ? AppTextStyles.drawerSelectedItem
                      : AppTextStyles.drawerItem,
                ),
              ),

              // Count
              Text(
                count,
                style: AppTextStyles.drawerCount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}