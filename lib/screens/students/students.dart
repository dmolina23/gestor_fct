import 'package:flutter/material.dart';
import 'package:gestor_fct/constants.dart';
import 'package:gestor_fct/screens/studentDetail/student_detail.dart';
import 'package:gestor_fct/screens/students/components/student_card.dart';
import 'package:gestor_fct/screens/students/components/students_list.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          splashRadius: 30,
          iconSize: 60,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: primaryText,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        title: Text(
          'Alumnos',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: TextFormField(
                  controller: null,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Buscar alumnos',
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    hintStyle: Theme.of(context).textTheme.bodyText2,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: lineColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: lineColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: backgroundColor,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: secondaryText,
                      size: 16,
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: SizedBox(height: 670, child: StudentList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
