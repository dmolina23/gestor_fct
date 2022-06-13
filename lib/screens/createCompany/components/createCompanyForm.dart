import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestor_fct/components/error.dart';
import 'package:gestor_fct/constants.dart';
import 'package:gestor_fct/screens/home/home.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CreateCompanyForm extends StatefulWidget {
  CreateCompanyForm({
    Key? key,
    required this.nameController,
    required this.tutorController,
    required this.addressController,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController tutorController;
  final TextEditingController addressController;

  @override
  _CreateCompanyFormState createState() => _CreateCompanyFormState();
}

class _CreateCompanyFormState extends State<CreateCompanyForm> {
  String value = "Selecciona una opción";
  final String query = """
    query {
      getAllCompanies {
        id
        name
      }
    }
  """;

  final String createCompany = """
    mutation createCompany(\$name: String!, \$tutor: String!, \$address: String!) {
    createCompany (
        name: \$name,
        tutor: \$tutor,
        address: \$address
    ) {
        id
    }
}
  """;

  @override
  Widget build(BuildContext context) {
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
              controller: widget.nameController,
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
              controller: widget.tutorController,
              onChanged: (_) => EasyDebounce.debounce(
                'textController1',
                const Duration(milliseconds: 2000),
                () => setState(() {}),
              ),
              autofocus: true,
              obscureText: false,
              decoration: const InputDecoration(
                labelText: 'Nombre del tutor',
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
              controller: widget.addressController,
              onChanged: (_) => EasyDebounce.debounce(
                'textController1',
                const Duration(milliseconds: 2000),
                () => setState(() {}),
              ),
              autofocus: true,
              obscureText: false,
              decoration: const InputDecoration(
                labelText: 'Dirección',
                enabledBorder: UnderlineInputBorder(
                  // ignore: unnecessary_const
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
      const SizedBox(
        height: 50,
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
        child: Mutation(
            options: MutationOptions(
                document: gql(createCompany),
                onCompleted: (dynamic resultData) {}),
            builder: (RunMutation runMutation, QueryResult? result) {
              return TextButton(
                onPressed: () => {
                  runMutation({
                    "name": widget.nameController.text,
                    "tutor": widget.tutorController.text,
                    "address": widget.addressController.text
                  }),
                  widget.nameController.text = "",
                  widget.tutorController.text = "",
                  widget.addressController.text = "",
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: result!.exception == null
                              ? const Text("OK")
                              : const Text("Error"),
                          content: result.exception == null
                              ? const Text("Empresa añadida correctamente")
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
                                                      const HomeScreen(),
                                                ));
                                          },
                                          child: const Text("Ir al inicio"))),
                                  CupertinoDialogAction(
                                    child: TextButton(
                                      child: const Text("Añadir otra"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  )
                                ]
                              : [
                                  CupertinoDialogAction(
                                    child: TextButton(
                                      child: const Text("Intentar de nuevo"),
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
                  textStyle: Theme.of(context).textTheme.subtitle2?.copyWith(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                  elevation: 3,
                ),
                child: const Text('Añadir Empresa'),
              );
            }),
      )
    ]);
  }
}
