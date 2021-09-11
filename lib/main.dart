
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Data/Constants.dart';
import 'Screens/emp_screen/Employee_Data_Screen.dart';
import 'Screens/emp_screen/cubit/employee_details_cubit.dart';
import 'Screens/home_screen/HomePage.dart';
import 'Screens/search_part/cubit/search_filter_cubit.dart';

void main() {
  runApp(EmployeeDirectoryApp());
}

class EmployeeDirectoryApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmployeeDetailsCubit>(
          create: (context) => EmployeeDetailsCubit(),
        ),
        /*BlocProvider<DatabaseCubit>(create: (context) => DatabaseCubit()),*/
        BlocProvider<SearchFilterCubit>(
          create: (context) => SearchFilterCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Employee Directory App',
        theme: ThemeData(primarySwatch: Constants.primary),
        home: HomePage(),
        routes: {
          HomePage.routeNameHomePage: (context) => HomePage(),
          EmployeeDetailsApp.routeNameEmployee: (context) =>
              EmployeeDetailsApp(),
        },
      ),
    );
  }
}
