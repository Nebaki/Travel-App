import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/pages/detail_page.dart';
import 'package:travelapp/pages/navigate_pages/main_pages.dart';
import 'package:travelapp/pages/welcome.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is LoadedState) {
            return  Mainpage();
          }
           if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator(),);
          }
          if (state is DetailState) {
            return  DetailPage();
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}
