import 'package:flutter/material.dart';
import 'package:gestor_fct/screens/companies/companies.dart';
import 'package:gestor_fct/screens/deals/deals.dart';
import 'package:gestor_fct/screens/home/home.dart';
import 'package:gestor_fct/screens/settings/settings.dart';
import 'package:gestor_fct/screens/students/students.dart';
import 'package:gestor_fct/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ligthThemeData(context),
      home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/settings': (context) => SettingsScreen(),
        '/companies': (context) => const CompaniesScreen(),
        '/students': (context) => const StudentsScreen(),
        '/deals': (context) => const DealsScreen()
      },
    );
  }
}
