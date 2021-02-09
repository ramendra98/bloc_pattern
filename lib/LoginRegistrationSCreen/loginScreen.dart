
import 'package:bloc_pattern/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Registration.dart';

class LoginPage extends StatefulWidget {
  bool changButton = false;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = LoginBloc();
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<String>(
                    stream: bloc.loginEmail,
                    builder: (context, snapshot) => TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter Email ID',
                          labelText: 'Email',
                          errorText: snapshot.error,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      // onChanged: (value) => print(value),
                      onChanged: bloc.changeLoginEmail,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  StreamBuilder<Object>(
                      stream: bloc.loginPass,
                      builder: (context, snapshot) {
                        return TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Enter Password',
                              labelText: 'Password',
                              errorText: snapshot.error,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          //onChanged: (value) => print(value),
                          onChanged: bloc.changeLoginPass,
                        );
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Registration()),
                      );
                    },
                    child: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Need have Account ?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        WidgetSpan(
                            child: SizedBox(
                          width: 5.0,
                        )),
                        TextSpan(
                            text: 'Create new Account ',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ))
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  _builButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _builButton() {
  
    final bloc = LoginBloc();
    return StreamBuilder<bool>(
        stream: bloc.isValid,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: snapshot.hasError ? null : () {},
            child: Container(
              height: 40.0,
              width: 120.0,

              color: snapshot.hasError ? Colors.grey : Colors.blueGrey,
              //onPressed: () {},
              child: Text(
                'SignIN',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }
}
