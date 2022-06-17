import 'package:flutter/material.dart';
import 'package:gestor_fct/screens/home/components/home_company_card.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';

class HomeCompaniesList extends StatefulWidget {
  const HomeCompaniesList({Key? key}) : super(key: key);

  @override
  _HomeCompaniesListState createState() => _HomeCompaniesListState();
}

class _HomeCompaniesListState extends State<HomeCompaniesList> {
  final String readAllCompanies = """
    query {
      getAllCompanies {
        id
        name
        address
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(document: gql(readAllCompanies)),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text("Error al cargar las empresas");
          }

          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List? companies = result.data!['getAllCompanies'];

          if (companies == null) {
            return const Text('No hay empresas todavía');
          }

          return Container(
            width: double.infinity,
            height: 116,
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: ListView.builder(
                itemCount: companies.length,
                itemBuilder: (context, index) {
                  final company = companies[index];
                  return CompanyCard(
                    name: company['name'],
                    address: company['address'],
                    id: company['id'],
                  );
                },
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        });
  }
}
