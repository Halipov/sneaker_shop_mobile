part of 'main_app_bloc.dart';

abstract class MainAppEvent extends Equatable {
  const MainAppEvent();

  @override
  List<Object> get props => [];
}

class MainAppPageTapped extends MainAppEvent {
  final AppMode appMode;

  MainAppPageTapped(this.appMode);
}

class AdminAppPageTapped extends MainAppEvent {
  final AppMode appMode;

  AdminAppPageTapped(this.appMode);
}
