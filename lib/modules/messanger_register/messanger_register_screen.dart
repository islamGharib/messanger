import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_app/models/user_model.dart';
import 'package:messanger_app/shared/component/components.dart';
import 'package:messanger_app/shared/cubit/cubit.dart';
import 'package:messanger_app/shared/cubit/states.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class MessangerRegisterScreen extends StatelessWidget {

  var emailController = TextEditingController();

  var passController = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  UserModel? model;



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessangerRegisterCubit,MessangerRegisterState>(
      listener: (context, state){

      },
      builder: (context,state){
        MessangerRegisterCubit loginCubit = MessangerRegisterCubit.get(context);
        UsersCubit user = UsersCubit.get(context);
        return Scaffold(
          appBar: AppBar(),

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
                        'REGISTER',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black
                        ),
                      ),
                      SizedBox(height: 40,),
                      defaultTextFormField(
                        controller: nameController,
                        type: TextInputType.text,
                        validate: (value){
                          if (value == null || value.isEmpty){
                            return 'User name must not to be empty';
                          }
                          return null;
                        },
                        label: 'User Name',
                        prefix: Icons.person,
                      ),
                      SizedBox(height: 15,),
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
                      defaultTextFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (value){
                          if (value == null || value.isEmpty){
                            return 'User phone must not to be empty';
                          }
                          return null;
                        },
                        label: 'Phone Number',
                        prefix: Icons.phone,
                      ),
                      SizedBox(height: 15,),
                      defaultButton(
                        buttonPressed: () async {
                          if(formKey.currentState!.validate()){
                            print(emailController.text);
                            print(passController.text);
                            model = UserModel(nameController.text, emailController.text, passController.text, phoneController.text);
                            await user.register(model: model!);
                            if(user.userIsExisted)
                              showFlutterToast(message: "User is already existed", state: ToastStates.ERROR);
                          }

                        },
                        text: 'Register',
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
    ;
    // return BlocProvider(create: (BuildContext context) => MessangerRegisterCubit(),

  }
}
