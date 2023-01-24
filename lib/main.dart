import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/cubit/app_cubit_logics.dart';
import 'package:travelapp/data_provider/data_service.dart';
import 'package:travelapp/pages/detail_page.dart';
import 'package:travelapp/pages/welcome.dart';
import 'package:travelapp/pages/navigate_pages/main_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home:  BlocProvider<AppCubit>(
        create: (context)=>AppCubit(
          data: dataservice()
        ),
        child: const AppCubitLogics() ,
      ),
    );
  }
}
