part of 'main_app_bloc.dart';

class MainAppState extends Equatable {
  final AppMode appMode;
  const MainAppState({this.appMode = AppMode.catalog});

  @override
  List<Object> get props => [appMode];
}

class MainAppInitial extends MainAppState {
  @override
  final AppMode appMode;

  MainAppInitial({this.appMode = AppMode.catalog});
}
