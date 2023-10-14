import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/app_cubit_logics.dart';
import 'package:trips/cubit/app_cubits.dart';
import 'package:trips/pages/detail_pages/cubit/store_page_info_cubit.dart';
import 'package:trips/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AppCubits>(
              create: (context) => AppCubits(data: DataServices())),
          BlocProvider<StorePageInfoCubits>(
            create: (context) => StorePageInfoCubits(),
          ),
        ],
        child: const AppCubitLogics(),
      ),
    );
  }
}
