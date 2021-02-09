
import 'package:bloc_pattern/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../LoginRegistrationSCreen/loginScreen.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  GlobalKey _key = GlobalKey<FormState>();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    final rebloc = RegisterBloc();

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
                    'Registration ',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<String>(
                      stream: rebloc.name,
                      builder: (context, snapshot) {
                        return TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter Your Name ',
                              labelText: 'Name',
                              errorText: snapshot.error,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onChanged: rebloc.changeName,
                        );
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  StreamBuilder<String>(
                      stream: rebloc.mobile,
                      builder: (context, snapshot) {
                        return TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: 'Enter Your Mobile No.',
                              labelText: 'Mo.',
                              errorText: snapshot.error,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onChanged: rebloc.changeMobile,
                        );
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  StreamBuilder<String>(
                      stream: rebloc.registerEmail,
                      builder: (context, snapshot) {
                        return TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Enter Email ID',
                              labelText: 'Email',
                              errorText: snapshot.error,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onChanged: rebloc.changeEmail,
                        );
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  StreamBuilder<String>(
                      stream: rebloc.registerPass,
                      builder: (context, snapshot) {
                        return TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Enter Password',
                              labelText: 'Password',
                              errorText: snapshot.error,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onChanged: rebloc.changePass,
                        );
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  StreamBuilder<String>(
                      stream: rebloc.confirmPass,
                      builder: (context, snapshot) {
                        return TextField(
                          obscureText: isVisible,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: isVisible
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                              ),
                              hintText: 'Confirm Password',
                              labelText: 'Re Password',
                              errorText: snapshot.error,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onChanged: rebloc.changeConfirmPass,
                        );
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Already have Account ?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        WidgetSpan(
                            child: SizedBox(
                          width: 5.0,
                        )),
                        TextSpan(
                            text: 'Login Account ',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ))
                      ]),
                    ),
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
    final bloc = Provider.of<RegisterBloc>(context, listen: false);
    return StreamBuilder<Object>(
        stream: bloc.isValid,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: snapshot.hasError ? null : () {},
            child: Container(
              height: 40.0,
              width: 120.0,
              alignment: Alignment.center,
              color: snapshot.hasError ? Colors.grey : Colors.blueGrey,
              child: Text(
                'SignUp',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }
}
