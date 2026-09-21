import 'package:flutter/material.dart';
import 'package:my_note/core/utils/app_colors.dart';

import 'category_bottom_sheet_item_widget.dart';

class CategoryBottomSheetBodyWidget extends StatelessWidget {
  const CategoryBottomSheetBodyWidget({super.key});

  static const Color backgroundColor = Color(0xFF111318);
  static const Color cardColor = Color(0xFF181C23);
  static const Color primaryColor = Color(0xFF20C878);
  static const Color secondaryTextColor = Color(0xFF9299AD);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag Handle
            Container(
              width: 80,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFF737987),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 28),

            // Header
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: primaryColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.sell_outlined,
                    color: Color(0xFF9AE8C5),
                    size: 30,
                  ),
                ),

                const SizedBox(width: 18),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose Category',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Select a category for your note',
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Categories
            CategoryBottomSheetItemWidget(
              title: 'Work',
              subtitle: 'Work related notes and tasks',
              icon: Icons.business_center_outlined,
              iconColor: AppColors.green,
              iconBackground: const Color(0xFFB5F0D5),
              onChoose: () {
                Navigator.pop(context, {
                  "category": "Work",
                  "category_color": AppColors.green,
                });
              },
            ),

            const SizedBox(height: 14),

            CategoryBottomSheetItemWidget(
              title: 'Personal',
              subtitle: 'Personal thoughts and notes',
              icon: Icons.person_outline,
              iconColor: AppColors.blue,
              iconBackground: const Color(0xFFA8D5FF),
              onChoose: () {
                Navigator.pop(context, {
                  "category": "Personal",
                  "category_color": AppColors.blue,
                });
              },
            ),

            const SizedBox(height: 14),

            CategoryBottomSheetItemWidget(
              title: 'Idea',
              subtitle: 'Ideas and inspirations',
              icon: Icons.lightbulb_outline,
              iconColor: AppColors.purple,
              iconBackground: const Color(0xFFC5B6FF),
              onChoose: () {
                Navigator.pop(context, {
                  "category": "Idea",
                  "category_color": AppColors.purple,
                });
              },
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

