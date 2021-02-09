import 'dart:async';

import 'package:bloc_pattern/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with Validator implements BasebLOC {
  final _loginEmail = BehaviorSubject<String>();
  final _loginPass = BehaviorSubject<String>();

  //Getters
  Stream<String> get loginEmail => _loginEmail.stream.transform(emailValidator);
  Stream<String> get loginPass =>
      _loginPass.stream.transform(passwordValidator);
  Stream<bool> get isValid =>
      Rx.combineLatest2(loginEmail, loginPass, (a, b) => true);

  //Setters

  Function(String) get changeLoginEmail => _loginEmail.sink.add;
  Function(String) get changeLoginPass => _loginPass.sink.add;

  @override
  void dispose() {
    _loginEmail?.close();
    _loginPass?.close();
  }
}

abstract class BasebLOC {
  void dispose();
}
