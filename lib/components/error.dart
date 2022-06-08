import 'package:flutter/material.dart';
import 'package:gestor_fct/constants.dart';
import 'package:gestor_fct/screens/home/home.dart';

class Error extends StatefulWidget {
  const Error({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  _ErrorState createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/545/545676.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '¡Error!',
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      fontFamily: 'Ubuntu',
                      color: Colors.black,
                      fontSize: 32,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  widget.error,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        fontFamily: 'Ubuntu',
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                child: TextButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: const Color(0xFF228F22),
                      shape: const StadiumBorder()),
                  child: const Text('Ir al inicio'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
