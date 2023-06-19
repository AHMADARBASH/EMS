import 'package:ems/blocs/auth/auth_cubit.dart';
import 'package:ems/blocs/auth/auth_states.dart';
import 'package:ems/data/local/local_data.dart';
import 'package:ems/layout/screens/home_screen.dart';
import 'package:ems/layout/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalData.init();
  runApp(EMS());
}

class EMS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Color(0xffed1c22),
              secondary: Color(0xffed1c22),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) =>
                state.isAuth ? HomeScreen() : LoginScreen(),
          ),
        ),
      ),
    );
  }
}
