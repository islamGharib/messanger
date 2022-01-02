
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_app/models/user_model.dart';
import 'package:messanger_app/modules/messanger_register/messanger_register_screen.dart';
import 'package:messanger_app/shared/component/components.dart';
import 'package:messanger_app/shared/cubit/cubit.dart';
import 'package:messanger_app/shared/cubit/states.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class MessangerLoginScreen extends StatelessWidget {

  var emailController = TextEditingController();

  var passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  UserModel? model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessangerLoginCubit, MessangerLoginState>(
        listener: (context, state){

        },
        builder: (context,state){
          MessangerLoginCubit loginCubit = MessangerLoginCubit.get(context);
          UsersCubit user = UsersCubit.get(context);
          return Scaffold(

            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black
                          ),
                        ),
                        SizedBox(height: 40,),
                        defaultTextFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value){
                            if (value == null || value.isEmpty){
                              return 'Email must not to be empty';
                            }
                            return null;
                          },
                          label: 'Email Address',
                          prefix: Icons.email,
                        ),
                        SizedBox(height: 15,),
                        defaultTextFormField(
                          controller: passController,
                          type: TextInputType.visiblePassword,
                          isPassword: loginCubit.isPassword,
                          validate: (value){
                            if (value == null || value.isEmpty){
                              return 'Password must not to be empty';
                            }
                            return null;
                          },
                          suffixPressed: (){
                            loginCubit.changePasswordVisibility();
                          },
                          onSubmit: (value){
                            if(formKey.currentState!.validate()){
                              print(emailController.text);
                              print(passController.text);

                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock,
                          suffix: loginCubit.suffix,
                        ),

                        SizedBox(height: 15,),
                        defaultButton(
                          buttonPressed: () async {
                            if(formKey.currentState!.validate()){
                              print(emailController.text);
                              print(passController.text);
                              await user.login(email: emailController.text, pass: passController.text);
                              model = user.model;
                              if(model == null) print('mail or password is not correct');
                              else print(model!.email);

                            }

                          },
                          text: 'Login',
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            defaultTextButton(
                              func: (){
                                navigateTo(context, MessangerRegisterScreen());
                              },
                              text: 'register',
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),

          );
        },
      );
  }
}
