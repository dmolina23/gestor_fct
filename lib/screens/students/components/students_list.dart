import 'package:flutter/material.dart';
import 'package:gestor_fct/screens/students/components/student_card.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final String readAllStudents = """
    query {
      getAllStudents {
          id
          firstName
          lastName
       }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(document: gql(readAllStudents)),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Center(
              child: Text(result.exception.toString()),
            );
          }

          List? students = result.data!['getAllStudents'];

          if (students == null) {
            return const Text('No hay alumnos todavía');
          }

          Future<void> _refresh() async {
            refetch!();
            return Future.delayed(const Duration(milliseconds: 500));
          }

          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];

                  return StudentCard(
                      firstName: student['firstName'],
                      lastName: student['lastName'],
                      id: student['id']);
                }),
          );
        });
  }
}
