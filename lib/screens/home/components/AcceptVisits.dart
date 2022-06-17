import 'package:flutter/material.dart';
import 'package:gestor_fct/screens/home/components/VisitCard.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AcceptVisits extends StatefulWidget {
  const AcceptVisits({Key? key}) : super(key: key);

  @override
  _AcceptVisitsState createState() => _AcceptVisitsState();
}

class _AcceptVisitsState extends State<AcceptVisits> {
  final String readAllVisits = """
    query {
      getAllVisits {
        id
        is_accepted
        date
        company {
          name
        }
      }
    }
  """;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
      child: Container(
        width: double.infinity,
        height: 30,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(-0.85, 1),
              child: Text(
                'Próximas visitas',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontFamily: 'Poppins',
                      fontSize: 26,
                    ),
              ),
            ),
            Query(
                options: QueryOptions(document: gql(readAllVisits)),
                builder: (QueryResult result,
                    {VoidCallback? refetch, FetchMore? fetchMore}) {
                  if (result.hasException) {
                    return const Text("Error al cargar las empresas");
                  }

                  if (result.isLoading) {
                    return const Text("Cargando datos...");
                  }

                  List? visits = result.data!['getAllVisits'];

                  if (visits == null) {
                    return const Text("No hay visitas todavía");
                  }

                  return Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: SizedBox(
                        height: 700,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: visits.length,
                            itemBuilder: (context, index) {
                              var visit = visits[index];
                              return VisitCard(
                                date: visit['date'],
                                companyName: visit['company']['name'],
                                accepted: visit['is_accepted'],
                              );
                            }),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
