import 'package:flutter/material.dart';
import 'package:gestor_fct/screens/home/components/companies_title.dart';
import 'package:gestor_fct/screens/home/components/bottom_nav.dart';
import 'package:gestor_fct/screens/home/components/companies_list.dart';
import 'package:gestor_fct/screens/home/components/header_home.dart';
import 'package:gestor_fct/screens/home/components/visits.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const HeaderHome(),
                      const CompaniesTitle(),
                      const CompaniesList(),
                      const VisitsComponent(),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: Container(
                          width: double.infinity,
                          height: 330,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                      const BottomNav()
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
