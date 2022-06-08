import 'package:flutter/material.dart';
import 'package:gestor_fct/constants.dart';

class DealCard extends StatelessWidget {
  const DealCard({Key? key, required this.company}) : super(key: key);

  final String company;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            const BoxShadow(
              blurRadius: 17,
              color: Colors.black,
              spreadRadius: 3,
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      company,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Text(
                        'Tech & Data',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: const Color(0xFF228F22),
                    shape: const StadiumBorder()),
                child: const Text('Ver detalles'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
