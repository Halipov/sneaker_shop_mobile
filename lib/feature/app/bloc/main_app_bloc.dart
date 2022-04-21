import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../enums/app_mode.dart';

part 'main_app_event.dart';
part 'main_app_state.dart';

class MainAppBloc extends Bloc<MainAppEvent, MainAppState> {
  MainAppBloc() : super(MainAppInitial()) {
    on<MainAppPageTapped>(
      (event, emit) {
        emit(
          MainAppState(appMode: event.appMode),
        );
      },
    );
    on<AdminAppPageTapped>(
      (event, emit) {
        emit(
          MainAppState(adminAppMode: event.appMode),
        );
      },
    );
  }
}
