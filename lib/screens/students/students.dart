import 'package:flutter/material.dart';
import 'package:gestor_fct/constants.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        title: Text(
          'Alumnos',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [],
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
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: TextFormField(
                  controller: null,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Buscar alumnos',
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    hintStyle: Theme.of(context).textTheme.bodyText2,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: lineColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: lineColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: backgroundColor,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: secondaryText,
                      size: 16,
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            boxShadow: [
                              const BoxShadow(
                                blurRadius: 17,
                                color: Colors.black26,
                                spreadRadius: 5,
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 8, 12, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/cd1fc4e4-5d02-4f18-afd7-a1ea42ff1f73/sportswear-club-fleece-pullover-hoodie-Gw4Nwq.png',
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Molina Gámez, David',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text('Ver detalles'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
