import 'dart:async';

mixin Validator {
  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.isEmpty) {
      return sink.addError("This field can't be empty");
    }
    if (email.contains("@")) {
      sink.add(email);
    }
    if (email.length > 20) {
      return sink.addError("Email Can't be more than 20 characters");
    }
    if (email.length < 6) {
      return sink.addError("Email cannot less 6 characters");
    }
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return sink.addError("Please Enter A Valid Email ");
    } else {
      sink.add(email);
    }
  });
  //Password

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.isEmpty) {
      return sink.addError("This field can't be empty");
    }
    if (password.length > 12) {
      return sink.addError("password Can't be more than 12 characters");
    }
    if (password.length < 6) {
      return sink.addError("password cannot less 6 characters");
    } else {
      sink.add(password);
    }
  });

//Name Validator
  var nameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.isEmpty) {
      return sink.addError("This field can't be empty");
    }
    if (name.length > 32) {
      return sink.addError("name Can't be more than 32 characters");
    }
    if (name.length < 6) {
      return sink.addError("name cannot less 6 characters");
    }
    if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(name)) {
      return sink.addError("Please Enter A Valid name ");
    } else {
      sink.add(name);
    }
  });

  //Phone Validater

  var phoneValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    if (phone.isEmpty) {
      return sink.addError("This field can't be empty");
    }
    if (phone.length > 10) {
      return sink.addError("phone Can't be more than 10 cdigit");
    }
    if (phone.length < 10) {
      return sink.addError("phone cannot less 10 digit");
    }
    if (!RegExp(r"[0-9]{10}").hasMatch(phone)) {
      return sink.addError("Please Enter Valid Mobile no.");
    } else {
      sink.add(phone);
    }
  });
}
