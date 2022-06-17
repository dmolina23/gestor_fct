import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gestor_fct/constants.dart';
import 'package:gestor_fct/screens/home/home.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateVisitWidget extends StatefulWidget {
  const CreateVisitWidget({Key? key, required this.companyId})
      : super(key: key);
  final String companyId;

  @override
  _CreateVisitWidgetState createState() => _CreateVisitWidgetState();
}

class _CreateVisitWidgetState extends State<CreateVisitWidget> {
  DateTime datePicked = DateTime.now();
  late String dropDownValue;
  late SharedPreferences sharedPreferences;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<int?> getUserId() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt("userId");
  }

  final String createVisit = """
    mutation createVisit (\$date: String!, \$companyId: ID!, \$teacherId: ID!) {
    createCompany (
        is_accepted: false,
        date: \$date,
        teacherId: \$teacherId,
        companyId: \$companyId,
    ) {
        id
    }
}
  """;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserId(),
        builder: (context, AsyncSnapshot<int?> snapshot) {
          if (snapshot.hasData) {
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: primaryText,
                                  size: 24,
                                ),
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
                        child: Text(
                          'Nueva Visita',
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    fontFamily: 'Poppins',
                                    fontSize: 32,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  actions: [],
                  elevation: 0,
                ),
              ),
              backgroundColor: backgroundColor,
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Text(
                              'Crea una nueva visita hacia una empresa.',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    fontFamily: 'Poppins',
                                    color: Color.fromARGB(255, 87, 99, 108),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                    child: InkWell(
                      onTap: () async {
                        await DatePicker.showDateTimePicker(
                          context,
                          showTitleActions: true,
                          onConfirm: (date) {
                            setState(() => datePicked = date);
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x4D101213),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              datePicked != null
                                  ? datePicked.toString()
                                  : 'Selecciona una fecha',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: Mutation(
                      options: MutationOptions(
                          document: gql(createVisit),
                          onCompleted: (dynamic resultData) {}),
                      builder: (RunMutation runMutation, QueryResult? result) {
                        return TextButton(
                          onPressed: () async {
                            runMutation({
                              "date": datePicked.toIso8601String,
                              "teacherId": snapshot.data,
                              "companyId": widget.companyId,
                            });
                            print(result);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CupertinoAlertDialog(
                                    title: result!.exception == null
                                        ? const Text("OK")
                                        : const Text("Error"),
                                    content: result.exception == null
                                        ? const Text(
                                            "Visita creada correctamente")
                                        : Text(result.exception.toString()),
                                    actions: result.exception == null
                                        ? [
                                            CupertinoDialogAction(
                                                child: TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                HomeScreen(),
                                                          ));
                                                    },
                                                    child: const Text(
                                                        "Ir al inicio"))),
                                            CupertinoDialogAction(
                                              child: TextButton(
                                                child: Text("Añadir otra"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            )
                                          ]
                                        : [
                                            CupertinoDialogAction(
                                              child: TextButton(
                                                child:
                                                    Text("Intentar de nuevo"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            )
                                          ],
                                  );
                                });
                          },
                          child: Text('Crear Visita'),
                          style: TextButton.styleFrom(
                            fixedSize: Size(270, 50),
                            backgroundColor: Colors.black,
                            textStyle:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
