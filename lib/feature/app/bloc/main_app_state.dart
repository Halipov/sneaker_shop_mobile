part of 'main_app_bloc.dart';

class MainAppState extends Equatable {
  final AppMode appMode;
  final AppMode adminAppMode;
  const MainAppState({
    this.appMode = AppMode.catalog,
    this.adminAppMode = AppMode.catalog,
  });

  @override
  List<Object> get props => [appMode, adminAppMode];
}

class MainAppInitial extends MainAppState {
  @override
  final AppMode appMode;

  MainAppInitial({this.appMode = AppMode.catalog});
  @override
  List<Object> get props => [appMode];
}
