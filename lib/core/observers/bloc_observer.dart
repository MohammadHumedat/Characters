import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

// Must you create an instance of this class in main class to start working with this methods.
class MyObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('------bloc is ------');
    debugPrint('$bloc');
    super.onChange(bloc, change);
    debugPrint('------change is------');
    debugPrint('$change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('------bloc is ------');
    debugPrint('$bloc');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('------bloc is ------');
    debugPrint('$bloc');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint(' [ERROR] => ${bloc.runtimeType}');
    debugPrint('Error: $error');
    debugPrint('StackTrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}
