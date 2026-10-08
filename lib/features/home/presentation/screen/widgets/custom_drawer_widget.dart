import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/features/trash_note/presentation/cubit/trash_note_cubit.dart';
import 'package:my_note/features/trash_note/presentation/screen/trash_note_screen.dart';

import '../../../data/model/note_model.dart';
import '../../cubits/fetch_note_cubit/fetch_note_cubit.dart';
import 'drawer_category_item_widget.dart';
import 'drawer_header_widget.dart';
import 'drawer_item_widget.dart';
import 'drawer_section_item_widget.dart';

/// A customized navigation drawer widget used on the home screen.
///
/// Displays the app header, top-level navigation items (such as "All Notes",
/// "Pinned", and "Trash"), user categories (e.g. "Personal", "Work", "Ideas"),
/// as well as bottom settings navigation. Integrates with [FetchNoteCubit]
/// and [TrashNoteCubit] to reflect active selections and item counts.
class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({super.key});

  @override
  State<CustomDrawerWidget> createState() => CustomDrawerWidgetState();
}

/// State for [CustomDrawerWidget].
class CustomDrawerWidgetState extends State<CustomDrawerWidget> {

  @override
  Widget build(BuildContext context) {
    // Current category or item name selected in the cubit
    String selectedItem = BlocProvider.of<FetchNoteCubit>(context).selectedItem;
    // Current index of the selected item in the navigation drawer
    int selectedIndex = BlocProvider.of<FetchNoteCubit>(context).selectedIndex;
    // Master list of notes retrieved from the cubit
    List<NoteModel> categories = BlocProvider.of<FetchNoteCubit>(context)
        .allList;
    return Drawer(
      width: 290,
      backgroundColor: AppColors.background,
      elevation: 0,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),

      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 24, 18, 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================
              // Header
              // =========================

              const DrawerHeaderWidget(),

              const SizedBox(height: 32),

              // =========================
              // Main Navigation
              // =========================
              DrawerItemWidget(
                icon: Icons.note_alt_outlined,
                title: 'All Notes',
                count: categories.length.toString(),
                selected: selectedItem == 'All Notes',
                selectedIndex: selectedIndex == 0,
                onTap: () {
                  BlocProvider.of<FetchNoteCubit>(context).selectCategory("All", 0);
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 6),

              DrawerItemWidget(
                icon: Icons.push_pin_outlined,
                title: 'Pinned',
                count: categories
                    .where((note) => note.isPinned == true)
                    .length
                    .toString(),
                selected: selectedItem == 'Pinned',
                selectedIndex: selectedIndex == 1,
                onTap: () {
                  BlocProvider.of<FetchNoteCubit>(context).selectCategory("Pinned", 1);
                  BlocProvider.of<FetchNoteCubit>(context).fetchNotes();
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 6),

              DrawerItemWidget(
                icon: Icons.delete_outline,
                title: 'Trash',
                count: BlocProvider.of<TrashNoteCubit>(context).trashList.length.toString(),
                selected: selectedItem == 'Trash',
                selectedIndex: selectedIndex == 5,
                onTap: () async {
                  BlocProvider.of<FetchNoteCubit>(context).selectItem("Trash", 5);
                  await Navigator.push(context, MaterialPageRoute(builder: (context)=> TrashNoteScreen()));
                  if (context.mounted) {
                    BlocProvider.of<FetchNoteCubit>(context).selectCategory("All", 0);
                  }
                },
              ),

              const SizedBox(height: 32),

              // =========================
              // Categories
              // =========================
              const DrawerSectionItemWidget(title: 'Categories'),

              const SizedBox(height: 14),

              DrawerCategoryItemWidget(
                title: 'Personal',
                count: categories
                    .where((note) => note.category == 'Personal')
                    .length
                    .toString(),
                color: AppColors.blue,
                selected: selectedItem == 'Personal',
                selectedIndex: selectedIndex == 3,
                onTap: () {
                  BlocProvider.of<FetchNoteCubit>(context).selectCategory("Personal", 2);
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 7),

              DrawerCategoryItemWidget(
                title: 'Work',
                count: categories
                    .where((note) => note.category == 'Work')
                    .length
                    .toString(),
                color: AppColors.primary,
                selected: selectedItem == 'Work',
                selectedIndex: selectedIndex == 2,
                onTap: () {
                  BlocProvider.of<FetchNoteCubit>(context).selectCategory("Work", 3);
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 7),

              DrawerCategoryItemWidget(
                title: 'Ideas',
                count: categories
                    .where((note) => note.category == 'Idea')
                    .length
                    .toString(),
                color: AppColors.purple,
                selected: selectedItem == 'Idea',
                selectedIndex: selectedIndex == 4,
                onTap: () {
                  BlocProvider.of<FetchNoteCubit>(context).selectCategory("Idea", 4);
                  Navigator.pop(context);
                },
              ),

              // =========================
              // Push Settings to Bottom
              // =========================
              const Spacer(),

              DrawerItemWidget(
                icon: Icons.settings_outlined,
                title: 'Settings',
                selected: selectedItem == 'Settings',
                selectedIndex: selectedIndex == 6,
                onTap: () {
                  BlocProvider.of<FetchNoteCubit>(context).selectItem("Settings", 6);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
