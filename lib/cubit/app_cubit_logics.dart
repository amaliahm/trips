import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/app_cubit_state.dart';
import 'package:trips/cubit/app_cubits.dart';
import 'package:trips/pages/detail_pages/detail_page.dart';
import 'package:trips/pages/navpages/main_page.dart';
import 'package:trips/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        }
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedState) {
          return const Center(
            child: MainPage(),
          );
        }
        if (state is DetailState) {
          return DetailPage();
        } else {
          return Container();
        }
      },
    ));
  }
}
