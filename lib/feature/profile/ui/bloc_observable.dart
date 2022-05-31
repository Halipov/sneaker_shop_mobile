import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    developer.log('onEvent $event', name: '$bloc onEvent');
  }

  @override
  void onCreate(BlocBase bloc) {
    developer.log('onCreate $bloc', name: '$bloc onCreate');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    developer.log('onChange $change', name: '$bloc onChange');
  }

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   developer.log('onTransition $transition', name: 'Transition');
  // }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    developer.log('onError $error');
    super.onError(bloc, error, stackTrace);
  }
}
