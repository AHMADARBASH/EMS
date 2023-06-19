import 'dart:io';
import 'package:ems/blocs/auth/auth_states.dart';
import 'package:ems/data/local/local_data.dart';
import 'package:ems/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitState());

  final repo = AuthRepository();

  Future<void> login(
      {required String username, required String password}) async {
    emit(AuthLoadingState());
    try {
      final response = await repo.login(username: username, password: password);
      await LocalData.saveData(
        key: 'token',
        data: response['token'],
      );
      await LocalData.saveData(
        key: 'user',
        data: json.encode(response['user']),
      );
      emit(AuthUpdateState(isAuth: true));
    } on HttpException catch (e) {
      emit(AuthErrorState(message: e.message));
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  Future<void> logout() async {
    await LocalData.deleteKey('token');
    await LocalData.deleteKey('user');
    emit(AuthUpdateState(isAuth: false));
  }
}
