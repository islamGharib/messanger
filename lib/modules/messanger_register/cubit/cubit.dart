import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_app/modules/messanger_register/cubit/states.dart';

class MessangerRegisterCubit extends Cubit<MessangerRegisterState>{
  MessangerRegisterCubit() : super(MessangerRegisterinitialState());
  static MessangerRegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword? Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(MessangerRegisterChangePasswordVisibilityState());
  }

}