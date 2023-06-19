import 'package:ems/blocs/auth/auth_cubit.dart';
import 'package:ems/blocs/auth/auth_states.dart';
import 'package:ems/layout/widgets/alert_dialog.dart';
import 'package:ems/layout/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordRevealed = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthErrorState) {
              showErrorDialog(
                  context: context,
                  title: 'Login Error',
                  content: state.message);
            }
          },
          builder: (context, state) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.asset('assets/images/car.png'),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextField(
                      hint: 'Username',
                      isPassword: false,
                      controller: usernameController,
                      validator: (value) {
                        if (value == '') {
                          return 'please enter username';
                        } else {
                          return null;
                        }
                      },
                      textAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      hint: 'Password',
                      isPassword: !isPasswordRevealed,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordRevealed = !isPasswordRevealed;
                            });
                          },
                          icon: isPasswordRevealed
                              ? Icon(
                                  Icons.lock_open,
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              : Icon(
                                  Icons.lock_outline_rounded,
                                  color: Theme.of(context).colorScheme.primary,
                                )),
                      controller: passwordController,
                      validator: (value) {
                        if (value == '') {
                          return 'please enter password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                      onTap: () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState!.save();
                        await BlocProvider.of<AuthCubit>(context).login(
                          username: usernameController.text,
                          password: passwordController.text,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: double.infinity,
                        height: 7.h,
                        alignment: Alignment.center,
                        child: state is AuthLoadingState
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
