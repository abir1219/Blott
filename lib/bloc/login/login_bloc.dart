import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finance_digest/utils/app_constants.dart';
import 'package:finance_digest/utils/sharedpreference_utils.dart';

import '../../utils/enums.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<ClickLoginEvent>(_saveLoginData);
  }

  FutureOr<void> _saveLoginData(ClickLoginEvent event, Emitter<LoginState> emit) async{
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    await SharedPreferencesUtils.init();
    await SharedPreferencesUtils.saveString(AppConstants.FIRST_NAME, event.firstname);
    await SharedPreferencesUtils.saveString(AppConstants.LAST_NAME, event.lastname);
    emit(state.copyWith(apiStatus: ApiStatus.success));
    //await Future.delayed(const Duration(seconds: 2),() => emit(state.copyWith(apiStatus: ApiStatus.success)),);
  }
}
