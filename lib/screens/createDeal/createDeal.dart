import 'package:flutter/material.dart';
import 'package:gestor_fct/constants.dart';
import 'package:gestor_fct/screens/createDeal/components/createDealForm.dart';
import 'package:gestor_fct/screens/createStudent/createStudentForm.dart';
import 'package:gestor_fct/screens/home/home.dart';

class CreateDeal extends StatefulWidget {
  const CreateDeal({Key? key}) : super(key: key);

  @override
  _CreateDealState createState() => _CreateDealState();
}

class _CreateDealState extends State<CreateDeal> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: IconButton(
                        splashRadius: 30,
                        iconSize: 50,
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: primaryText,
                          size: 24,
                        ),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                child: Text(
                  'Nuevo Acuerdo',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontFamily: 'Poppins', fontSize: 42, color: Colors.black),
                ),
              )
            ],
          ),
          actions: const [],
          elevation: 0,
        ),
      ),
      backgroundColor: backgroundColor,
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Text(
                    'Añade un nuevo acuerdo',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontFamily: 'Poppins',
                          color: secondaryText,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        CreateDealForm(),
      ]),
    );
  }
}
