
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LoginRegistrationSCreen/loginScreen.dart';
import 'bloc/login_bloc.dart';
import 'bloc/register_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(create: (context)=>LoginBloc(),),
        Provider<RegisterBloc>(create: (context)=>RegisterBloc(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BLOC',
        home: LoginPage(),
        
      ),
    );
  }
}