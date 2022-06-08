import 'package:flutter/material.dart';
import 'package:gestor_fct/constants.dart';
import 'package:gestor_fct/screens/deals/components/deal_list.dart';
import 'package:gestor_fct/screens/home/home.dart';

class DealsScreen extends StatefulWidget {
  const DealsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DealsScreenState createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          splashRadius: 30,
          iconSize: 60,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: primaryText,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
        ),
        title: Text(
          'Acuerdos',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: SizedBox(height: 670, child: DealList()))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
