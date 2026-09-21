import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/features/home/data/model/note_model.dart';

import '../../cubits/fetch_note_cubit/fetch_note_cubit.dart'
    show FetchNoteCubit, FetchNoteState;
import 'build_category_list_view_item_widget.dart';

class CategoriesListViewBuilderWidget extends StatefulWidget {
  const CategoriesListViewBuilderWidget({super.key});

  @override
  State<CategoriesListViewBuilderWidget> createState() =>
      _CategoriesListViewBuilderWidgetState();
}

class _CategoriesListViewBuilderWidgetState
    extends State<CategoriesListViewBuilderWidget> {
  final List<String> categories = ["All", "Pinned", "Personal", "Work", "Idea"];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNoteCubit, FetchNoteState>(
      builder: (context, state) {
        List<NoteModel> notesList = BlocProvider.of<FetchNoteCubit>(context)
            .notesList;
        return SizedBox(
          width: double.infinity,
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => BuildCategoryListViewItemWidget(
              onTap: () {
                BlocProvider.of<FetchNoteCubit>(context)
                    .fetchSpecificNote(categories[index]);
                selectedIndex = index;
              },
              text: categories[index],
              index: index,
              selectedIndex: selectedIndex,
            ),
          ),
        );
      },
    );
  }
}
