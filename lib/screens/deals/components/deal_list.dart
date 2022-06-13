import 'package:flutter/material.dart';
import 'package:gestor_fct/components/error.dart';
import 'package:gestor_fct/screens/deals/components/deal_card.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DealList extends StatefulWidget {
  const DealList({Key? key}) : super(key: key);

  @override
  _DealListState createState() => _DealListState();
}

class _DealListState extends State<DealList> {
  final String readAllDeals = """
query {
  getAllDeals {
    company {
      name
    }
  }
}
""";
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(document: gql(readAllDeals)),
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

          if (deals == null) {
            return const Error(error: 'No hay acuerdos todavía');
          }

          Future<void> _refresh() async {
            refetch!();
            return Future.delayed(const Duration(milliseconds: 500));
          }

          return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                  itemCount: deals.length,
                  itemBuilder: (context, index) {
                    final deal = deals[index];
                    return DealCard(company: deal['company']['name']);
                  }));
        });
  }
}
