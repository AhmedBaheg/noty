import 'package:flutter/cupertino.dart';

import 'build_category_list_view_item_widget.dart';

class CategoriesListViewBuilderWidget extends StatefulWidget {
  const CategoriesListViewBuilderWidget({super.key});

  @override
  State<CategoriesListViewBuilderWidget> createState() => _CategoriesListViewBuilderWidgetState();
}

class _CategoriesListViewBuilderWidgetState extends State<CategoriesListViewBuilderWidget> {
  final List<String> categories = ["All", "Pinned", "Personal", "Work", "Ideas"];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => BuildCategoryListViewItemWidget(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          text: categories[index],
          index: index,
          selectedIndex: selectedIndex,
        ),
      ),
    );
  }
}
