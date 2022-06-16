import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestor_fct/constants.dart';
import 'package:gestor_fct/models/login_req_model.dart';
import 'package:gestor_fct/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late bool passwordVisible;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisible = false;
  }

  signIn(LoginRequestModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
    Map <String, String> reqHeaders = {'Content-Type': 'application/json'};

    // ignore: prefer_typing_uninitialized_variables
    var jsonResponse;

    var response = await http
        .post(Uri.parse('http://192.168.0.16:3000/auth/login'), headers: reqHeaders, body: jsonEncode(model.toJson()));

    jsonResponse = json.decode(response.body);

    if (jsonResponse['ok']) {
      sharedPreferences.setString("x-token", jsonResponse['token']);
      sharedPreferences.setInt("userId", jsonResponse['id']);
      
      emailController.text = "";
      passwordController.text = "";
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {

    LoginRequestModel model = LoginRequestModel(email: emailController.text, password: passwordController.text);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFC4FBAC),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(
          color: Color(0xFFEEEEEE),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, buttonPrimary]),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 90),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(55, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 242,
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontFamily: 'Lexend Deca',
                                      color: const Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'Enter your email here...',
                            hintStyle:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontFamily: 'Lexend Deca',
                                      color: const Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 0, 24),
                          ),
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF2B343A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: !passwordVisible,
                          decoration: InputDecoration(
                            labelStyle:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontFamily: 'Lexend Deca',
                                      color: const Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'Enter your password here...',
                            hintStyle:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontFamily: 'Lexend Deca',
                                      color: const Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 24, 24),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => passwordVisible = !passwordVisible,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: const Color(0xFF95A1AC),
                                size: 22,
                              ),
                            ),
                          ),
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF2B343A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () async {
                          signIn(model);
                        },
                        style: TextButton.styleFrom(
                          fixedSize: Size(120, 60),
                          backgroundColor: const Color(0xFF090F13),
                          textStyle:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                          elevation: 3,
                        ),
                        child: const Text('Acceder'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 75, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 3,
                        decoration: const BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                      ),
                      Text(
                        'Otras formas de acceder',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Container(
                        width: 50,
                        height: 3,
                        decoration: const BoxDecoration(
                          color: const Color(0xFFEEEEEE),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: const Color(0xFF090F13),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    2, 2, 2, 2),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/images/google.svg',
                                      color: Colors.white,
                                      height: 15,
                                      width: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Google',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 0, 8, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: const Color(0xFF090F13),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  child: IconButton(
                                    padding: const EdgeInsetsDirectional.fromSTEB(2, 3, 2, 2),
                                    icon: const Icon(
                                      Icons.fingerprint_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              Text(
                                'Biometría',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 12,
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
          ),
        ),
      ),
    );
  }
}
