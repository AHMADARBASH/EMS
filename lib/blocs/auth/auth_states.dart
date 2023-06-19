import 'package:ems/data/local/local_data.dart';

abstract class AuthState {
  bool isAuth;
  AuthState({required this.isAuth});
}

class AuthInitState extends AuthState {
  AuthInitState() : super(isAuth: LocalData.containsKey('token'));
}

class AuthUpdateState extends AuthState {
  AuthUpdateState({required super.isAuth});
}

class AuthLoadingState extends AuthState {
  AuthLoadingState() : super(isAuth: false);
}

class AuthErrorState extends AuthState {
  String message;
  AuthErrorState({required this.message}) : super(isAuth: false);
}
