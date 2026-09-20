import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    debugPrint('Change = $change');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    // TODO: implement onClose
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    // TODO: implement onCreate
  }

  @override
  void onDone(Bloc<dynamic, dynamic> bloc, Object? event,
      [Object? error, StackTrace? stackTrace]) {
    // TODO: implement onDone
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc,
      Transition<dynamic, dynamic> transition) {
    // TODO: implement onTransition
  }
}

@override
void onClose(BlocBase<dynamic> bloc) {
  // TODO: implement onClose
}

@override
void onCreate(BlocBase<dynamic> bloc) {
  // TODO: implement onCreate
}

@override
void onDone(Bloc<dynamic, dynamic> bloc, Object? event,
    [Object? error, StackTrace? stackTrace]) {
  // TODO: implement onDone
}

@override
void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
  // TODO: implement onError
}

@override
void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
  // TODO: implement onEvent
}

@override
void onTransition(Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition) {
  // TODO: implement onTransition
}