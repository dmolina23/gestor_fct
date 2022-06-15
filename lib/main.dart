import 'package:flutter/material.dart';
import 'package:gestor_fct/screens/companies/companies.dart';
import 'package:gestor_fct/screens/deals/deals.dart';
import 'package:gestor_fct/screens/home/home.dart';
import 'package:gestor_fct/screens/login/login.dart';
import 'package:gestor_fct/screens/settings/settings.dart';
import 'package:gestor_fct/screens/students/students.dart';
import 'package:gestor_fct/theme.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await initHiveForFlutter();

  var token = '';

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.getString("x-token") != null) {
    token = '"${sharedPreferences.getString("x-token")!}"';
  }

  final HttpLink link = HttpLink("http://192.168.0.16:3000/graph",
      defaultHeaders: {'x-token': token});

  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
    link: link,
    cache: GraphQLCache(store: HiveStore()),
  ));

  runApp(GraphQLProvider(
    client: client,
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("x-token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ligthThemeData(context),
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomeScreen(),
        '/settings': (context) => SettingsScreen(),
        '/companies': (context) => const CompaniesScreen(),
        '/students': (context) => const StudentsScreen(),
        '/deals': (context) => const DealsScreen()
      },
    );
  }
}
