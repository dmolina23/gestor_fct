import 'package:flutter/material.dart';
import 'package:gestor_fct/screens/home/components/home_company_card.dart';

class HomeCompaniesList extends StatelessWidget {
  const HomeCompaniesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 116,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          children: const [
            CompanyCard(),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: CompanyCard()
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: CompanyCard()
            ),
          ],
        ),
      ),
    );
  }
}
