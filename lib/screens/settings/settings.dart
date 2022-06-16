import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gestor_fct/components/error.dart';

import 'package:gestor_fct/constants.dart';
import 'package:gestor_fct/screens/login/login.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({
    Key? key,
    switchListTileValue,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool? switchListTileValue;
  SharedPreferences? sharedPreferences;
  int? userId;

  String? getUserData;

  Future<int?> getUserId() async {
    sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences!.getInt("userId");
    return sharedPreferences!.getInt("userId");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int?>(
        future: getUserId(),
        builder: (context, AsyncSnapshot<int?> snapshot) {
          if (snapshot.hasData) {
            getUserData = """
              query {
                getTeacherById (id: ${snapshot.data}) {
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
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  iconTheme: const IconThemeData(color: secondaryText),
                  automaticallyImplyLeading: true,
                  title: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0,
                ),
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

                      return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 76,
                                              height: 76,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/profile.png',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                userData['firstName'] +
                                                    ' ' +
                                                    userData['lastName'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Text(
                                                  userData['email'],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.copyWith(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF228F22),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 10,
                                                  color: Colors.black26,
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 1),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child:
                                                        SwitchListTile.adaptive(
                                                      value:
                                                          switchListTileValue ??=
                                                              false,
                                                      onChanged: (newValue) =>
                                                          setState(() =>
                                                              switchListTileValue =
                                                                  newValue),
                                                      title: Text(
                                                        'Notificaciones',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1,
                                                      ),
                                                      tileColor:
                                                          Color(0xFFF5F5F5),
                                                      activeColor:
                                                          Color(0xFF228F22),
                                                      activeTrackColor:
                                                          kPrimaryColor,
                                                      dense: false,
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .trailing,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            // onTap: () async {
                                            //   await Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) => ChangePasswordWidget(),
                                            //     ),
                                            //   );
                                            // },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10,
                                                    color: Colors.black26,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Cambiar contraseña',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.9, 0),
                                                        child: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color:
                                                              Color(0xFF95A1AC),
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 1, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            // onTap: () async {
                                            //   await Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) => LoginWidget(),
                                            //     ),
                                            //   );
                                            // },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10,
                                                    color: Colors.black26,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 0, 0),
                                                child: GestureDetector(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Cerrar Sesión',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1,
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.9, 0),
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            color: Color(
                                                                0xFF95A1AC),
                                                            size: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  onTap: () async {
                                                    sharedPreferences =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    await sharedPreferences!
                                                        .clear();
                                                    // ignore: use_build_context_synchronously
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const LoginPage(),
                                                            ),
                                                            (route) => false);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]);
                    }));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
