import 'package:flutter/material.dart';
import 'package:gestor_fct/screens/students/components/student_card.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  final String readAllTeachers = """
    query {
      getAllTeachers {
          firstName
          lastName
       }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Query(
          options: QueryOptions(document: gql(readAllTeachers)),
          builder: (QueryResult result,
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            if (result.hasException) {
              return Center(
                child: Text(result.exception.toString()),
              );
            }

            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            List? teachers = result.data!['getAllTeachers'];

            if (teachers == null) {
              return const Text('No Teachers');
            }

            return ListView.builder(
                itemCount: teachers.length,
                itemBuilder: (context, index) {
                  final teacher = teachers[index];

                  return StudentCard(
                    firstName: teacher['firstName'],
                    lastName: teacher['lastName'],
                  );
                });
          }),
    );
  }
}
