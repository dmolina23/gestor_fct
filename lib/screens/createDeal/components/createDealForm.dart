import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestor_fct/components/error.dart';
import 'package:gestor_fct/constants.dart';
import 'package:gestor_fct/screens/home/home.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CreateDealForm extends StatefulWidget {
  CreateDealForm({Key? key}) : super(key: key);
  @override
  _CreateDealFormState createState() => _CreateDealFormState();
}

class _CreateDealFormState extends State<CreateDealForm> {
  String value = "Selecciona una opción";
  final String query = """
    query {
      getAllCompanies {
        id
        name
      }
    }
  """;

  final String createDeal = """
    mutation createDeal(\$teacherId: ID!, \$companyID: ID!) {
    createDeal (
        teacherId: \$teacherId,
        companyId: \$companyId,
    ) {
        id
    }
}
  """;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(document: gql(query)),
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

        List? companies = result.data!['getAllCompanies'];
        List options = [];

        companies?.forEach((element) {
          options.add(element['id'] + '.- ' + element['name']);
        });

        if (companies == null) {
          options.add("0.-Debes crear una empresa primero");
        }

        return Column(children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x4D101213),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: SizedBox(
                    height: 50,
                    width: 180,
                    child: DropdownButton(
                      underline: Container(),
                      items: options
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (selected) => {
                        if (selected is String) setState(() => value = selected)
                      },
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontFamily: 'Poppins', color: Colors.black),
                      hint: Text(value),
                      focusColor: Colors.white,
                      elevation: 2,
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
            child: Mutation(
                options: MutationOptions(
                    document: gql(createDeal),
                    onCompleted: (dynamic resultData) {}),
                builder: (RunMutation runMutation, QueryResult? result) {
                  return TextButton(
                    onPressed: () => {
                      runMutation({
                        // Por ahora es 1
                        // ignore: todo
                        // TODO: Cambiarlo por el ID del usuario que ha hecho login
                        "teacherId": 2,
                        "companyId": int.parse(value.split('.')[0])
                      }),
                      value = "",
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: result!.exception == null
                                  ? const Text("OK")
                                  : const Text("Error"),
                              content: result!.exception == null
                                  ? const Text("Acuerdo creado correctamente")
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
                                              child:
                                                  const Text("Ir al inicio"))),
                                      CupertinoDialogAction(
                                        child: TextButton(
                                          child: Text("Añadir otro"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      )
                                    ]
                                  : [
                                      CupertinoDialogAction(
                                        child: TextButton(
                                          child: Text("Intentar de nuevo"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      )
                                    ],
                            );
                          })
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: const Size(270, 50),
                      backgroundColor: Colors.black,
                      textStyle:
                          Theme.of(context).textTheme.subtitle2?.copyWith(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 16,
                              ),
                      elevation: 3,
                    ),
                    child: const Text('Crear Acuerdo'),
                  );
                }),
          )
        ]);
      },
    );
  }
}
