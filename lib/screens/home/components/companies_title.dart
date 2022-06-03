import 'package:flutter/material.dart';

class CompaniesTitle extends StatelessWidget {
  const CompaniesTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: Text(
                  'Mis empresas',
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontFamily: 'Poppins', fontSize: 26),
                ),
              ),
              IconButton(
                iconSize: 60,
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/companies');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
