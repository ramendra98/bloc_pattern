import 'dart:async';
import 'package:bloc_pattern/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Object with Validator implements BaseBlo {
  final _registerEmail = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();
  final _registerPass = BehaviorSubject<String>();
  final _confirmPass = BehaviorSubject<String>();
  final _mobile = BehaviorSubject<String>();

//Getters
  Stream<String> get registerEmail =>
      _registerEmail.stream.transform(emailValidator);
  Stream<String> get name => _name.stream.transform(nameValidator);
  Stream<String> get registerPass =>
      _registerPass.stream.transform(passwordValidator);
  Stream<String> get confirmPass =>
      _confirmPass.stream.transform(passwordValidator);
  Stream<String> get mobile => _mobile.stream.transform(phoneValidator);
  Stream<bool> get isValid => Rx.combineLatest5(registerEmail, name,
      registerPass, confirmPass, mobile, (a, b, c, d, e) => true);
  Stream<bool> get isPasswordMatched =>
      Rx.combineLatest2(registerPass, confirmPass, (a, b) {
        if (a != b) {
          return false;
        } else {
          return true;
        }
      });

//Setter
  Function(String) get changeName => _name.sink.add;
  Function(String) get changeEmail => _registerEmail.sink.add;
  Function(String) get changeMobile => _mobile.sink.add;
  Function(String) get changePass => _registerPass.sink.add;
  Function(String) get changeConfirmPass => _confirmPass.sink.add;

  @override
  void dispose() {
    _registerPass?.close();
    _confirmPass?.close();
    _name?.close();
    _registerEmail?.close();
    _mobile?.close();
  }
}

abstract class BaseBlo {
  void dispose();
}
