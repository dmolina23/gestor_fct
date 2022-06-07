import 'package:flutter/material.dart';
import 'package:gestor_fct/screens/companies/components/company_card.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({Key? key}) : super(key: key);

  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
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
            return Center(
              child: Text(result.exception.toString()),
            );
          }

          List? companies = result.data!['getAllCompanies'];

          if (companies == null) {
            return const Text('No hay empresas todavía');
          }

          Future<void> _refresh() async {
            refetch!();
            return Future.delayed(const Duration(milliseconds: 500));
          }

          return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                  itemCount: companies.length,
                  itemBuilder: (context, index) {
                    final company = companies[index];
                    return CompanyCard(
                        name: company['name'],
                        address: company['address'],
                        id: company['id']);
                  }));
        });
  }
}
