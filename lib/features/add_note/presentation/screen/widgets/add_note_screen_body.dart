import 'package:flutter/material.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/core/utils/app_text_styles.dart';

import 'category_bottom_sheet_body_widget.dart';
import 'custom_add_note_bar_button.dart';
import 'custom_text_form_field_widget.dart';

class AddNoteScreenBody extends StatelessWidget {
  const AddNoteScreenBody({
    super.key,
    required this.formKey,
    required this.autoValidateMode,
    required this.title,
    required this.content,
    required this.onTitleSaved,
    required this.onContentSaved,
    this.selectedCategory,
    required this.onChangeCategory, required this.onChangeCategoryColo,
  });

  final GlobalKey<FormState> formKey;

  final AutovalidateMode autoValidateMode;

  final String? title, content;
  final String? selectedCategory;

  final String? Function(String?)? onTitleSaved;
  final String? Function(String?)? onContentSaved;
  final Function(String?)? onChangeCategory;
  final Function(Color?)? onChangeCategoryColo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            CustomTextFormFieldWidget(
              onSaved: onTitleSaved,
              hint: "Title",
              style: AppTextStyles.input.copyWith(fontSize: 20),
              hintStyle: AppTextStyles.hint.copyWith(fontSize: 20),
            ),
            Divider(color: AppColors.border, thickness: 1),
            Expanded(
              child: CustomTextFormFieldWidget(
                onSaved: onContentSaved,
                hint: "Start writing your content...",
              ),
            ),
            Row(
              children: [
                CustomAddNoteBarButton(icon: Icons.text_fields, onTap: () {}),
                CustomAddNoteBarButton(
                  icon: Icons.format_list_bulleted,
                  onTap: () {},
                ),
                CustomAddNoteBarButton(
                  icon: Icons.image_outlined,
                  onTap: () {},
                ),
                const Spacer(),
                TextButton(
                  onPressed: () async {
                    final result = await showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return CategoryBottomSheetBodyWidget();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      backgroundColor: AppColors.background,
                    );
                    if (result != null) {
                      onChangeCategory!(result["category"]);
                      onChangeCategoryColo!(result["category_color"]);
                    }
                  },
                  child: Text(
                    selectedCategory ?? "Category",
                    style: AppTextStyles.hint.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

