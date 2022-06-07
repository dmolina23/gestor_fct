import 'package:flutter/material.dart';
import 'package:gestor_fct/screens/companies/companies.dart';
import 'package:gestor_fct/screens/deals/deals.dart';
import 'package:gestor_fct/screens/home/home.dart';
import 'package:gestor_fct/screens/settings/settings.dart';
import 'package:gestor_fct/screens/students/students.dart';
import 'package:gestor_fct/theme.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();
  final HttpLink link =
      HttpLink("http://192.168.0.16:3000/graph", defaultHeaders: {
    'x-token':
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBhZG1pbi5lcyJ9.rDYixKNR9HTvvnTHpeK3pqUvy7oW_574mvhPCRqGlJs'
  });

  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
    link: link,
    cache: GraphQLCache(store: HiveStore()),
  ));

  runApp(GraphQLProvider(
    client: client,
    child: const MyApp(),
  ));
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
