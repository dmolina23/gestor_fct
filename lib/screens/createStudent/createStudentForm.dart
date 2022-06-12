import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestor_fct/components/error.dart';
import 'package:gestor_fct/constants.dart';
import 'package:gestor_fct/screens/home/home.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CreateStudentForm extends StatefulWidget {
  CreateStudentForm({
    Key? key,
    required this.firstNameController,
    required this.lastNameController,
    required this.courseController,
  }) : super(key: key);
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController courseController;

  @override
  _CreateStudentFormState createState() => _CreateStudentFormState();
}

class _CreateStudentFormState extends State<CreateStudentForm> {
  String value = "Selecciona una opción";
  final String query = """
    query {
      getAllDeals {
        id
        company {
          name
        }
      }
    }
  """;

  final String createStudent = """
    mutation createStudent(\$firstName: String!, \$lastName: String!, \$course: String!, \$dealId: ID!) {
    createStudent (
        firstName: \$firstName,
        lastName: \$lastName,
        course: \$course,
        dealId: \$dealId
    ) {
        id
        firstName
        lastName
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

        List? deals = result.data!['getAllDeals'];
        List options = [];

        deals?.forEach((element) {
          options.add(element['id'] + '.- ' + element['company']['name']);
        });

        if (deals == null) {
          options.add("1");
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
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: TextFormField(
                  controller: widget.firstNameController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController1',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),
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
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: TextFormField(
                  controller: widget.lastNameController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController1',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    labelText: 'Apellidos',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),
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
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: TextFormField(
                  controller: widget.courseController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController1',
                    const Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    labelText: 'Curso',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),
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
                    document: gql(createStudent),
                    onCompleted: (dynamic resultData) {}),
                builder: (RunMutation runMutation, QueryResult? result) {
                  return TextButton(
                    onPressed: () => {
                      runMutation({
                        "firstName": widget.firstNameController.text,
                        "lastName": widget.lastNameController.text,
                        "course": widget.courseController.text,
                        "dealId": int.parse(value.split('.')[0])
                      }),
                      widget.firstNameController.text = "",
                      widget.lastNameController.text = "",
                      widget.courseController.text = "",
                      value = "",
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: result!.exception == null
                                  ? const Text("OK")
                                  : Text(result.exception.toString()),
                              content:
                                  const Text("Alumno creado correctamente"),
                              actions: [
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
                                        child: const Text("Ir al inicio"))),
                                CupertinoDialogAction(
                                  child: TextButton(
                                    child: const Text("Añadir otro"),
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
                    child: const Text('Añadir Alumno'),
                  );
                }),
          )
        ]);
      },
    );
  }
}
