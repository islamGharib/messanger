import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_app/modules/messanger_login/messanger_login_screen.dart';
import 'package:messanger_app/modules/messanger_register/cubit/cubit.dart';
import 'package:messanger_app/shared/cubit/cubit.dart';
import 'package:messanger_app/shared/cubit/states.dart';

import 'modules/messanger_login/cubit/cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => UsersCubit()..createDatabase()),
        BlocProvider(create: (BuildContext context) => MessangerLoginCubit()),
        BlocProvider(create: (BuildContext context) => MessangerRegisterCubit()),
      ],
      child: BlocConsumer<UsersCubit,UsersStates>(
        listener: (context, state){

        },
        builder: (context, state){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MessangerLoginScreen()
          );
        },
      ),
    );
  }
}
