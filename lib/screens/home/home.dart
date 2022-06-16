import 'package:flutter/material.dart';
import 'package:gestor_fct/components/error.dart';
import 'package:gestor_fct/screens/home/components/AcceptVisits.dart';
import 'package:gestor_fct/screens/home/components/companies_title.dart';
import 'package:gestor_fct/screens/home/components/bottom_nav.dart';
import 'package:gestor_fct/screens/home/components/home_companies_list.dart';
import 'package:gestor_fct/screens/home/components/header_home.dart';
import 'package:gestor_fct/screens/home/components/visits.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences? sharedPreferences;
  String? getUserData;

  Future<List?> getUserId() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var preferences = [];
    preferences.add(sharedPreferences!.getInt("userId"));
    preferences.add(sharedPreferences!.getBool("is_admin"));
    return preferences;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserId(),
        builder: (context, AsyncSnapshot<List?> snapshot) {
          if (snapshot.hasData) {
            getUserData = """
              query {
                getTeacherById (id: ${snapshot.data![0]}) {
                  id,
                  email,
                  password,
                  firstName,
                  lastName,
                  is_admin
               }
            }
            """;

            return Scaffold(
                body: Query(
                    options: QueryOptions(document: gql(getUserData!)),
                    builder: (QueryResult result,
                        {VoidCallback? refetch, FetchMore? fetchMore}) {
                      if (result.hasException) {
                        return Error(
                          error: result.exception.toString(),
                        );
                      }

                      if (result.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      Map<String, dynamic> userData =
                          result.data!["getTeacherById"];

                      return SafeArea(
                        child: GestureDetector(
                          onTap: () => FocusScope.of(context).unfocus(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      HeaderHome(
                                        username: userData['firstName'],
                                      ),
                                      const CompaniesTitle(),
                                      const HomeCompaniesList(),
                                      snapshot.data![1]
                                          ? const AcceptVisits()
                                          : const VisitsComponent(),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 20, 20, 0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 330,
                                          decoration: const BoxDecoration(),
                                        ),
                                      ),
                                      const BottomNav()
                                    ]),
                              )
                            ],
                          ),
                        ),
                      );
                    }));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
