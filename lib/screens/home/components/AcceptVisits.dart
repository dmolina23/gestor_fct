import 'package:flutter/material.dart';
import 'package:gestor_fct/screens/home/components/VisitCard.dart';

class AcceptVisits extends StatefulWidget {
  const AcceptVisits({Key? key}) : super(key: key);

  @override
  _AcceptVisitsState createState() => _AcceptVisitsState();
}

class _AcceptVisitsState extends State<AcceptVisits> {
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
                'Nuevas visitas',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontFamily: 'Poppins',
                      fontSize: 26,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.max, children: [VisitCard()]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
