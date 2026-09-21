import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_note/core/utils/app_texts.dart';
import 'package:my_note/features/home/data/model/note_model.dart';

import 'features/add_note/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'features/add_note/presentation/screen/simple_bloc_observer.dart';
import 'features/home/presentation/cubits/fetch_note_cubit/fetch_note_cubit.dart';
import 'features/home/presentation/screen/home_screen.dart';
import 'features/note_details/presentation/cubits/add_note_cubit/edit_note_cubit.dart';

void main() async {
  // Ensure widget bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for Flutter
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  // To register my model adapter
  Hive.registerAdapter(NoteModelAdapter());

  // Open your first box (e.g., 'user_box')
  try {
    await Hive.openBox<NoteModel>(AppTexts.noteBox);
  } catch (e) {
    // إذا فشل الفتح بسبب تلف الملف، نمسحه من القرص ونعير فتحه
    await Hive.deleteBoxFromDisk(AppTexts.noteBox);
    await Hive.openBox<NoteModel>(AppTexts.noteBox);
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
        BlocProvider(
          create: (context) => FetchNoteCubit(),
        ),
        BlocProvider(
          create: (context) => EditNoteCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
