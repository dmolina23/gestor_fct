import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 110,
        decoration: const BoxDecoration(
          color: Color(0xFFEEEEEE),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Color(0x91000000),
              spreadRadius: 7,
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-0.8, 0),
                    child: Text('Buenas tardes, $username',
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontFamily: 'Ubuntu', fontSize: 30)),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'Tienes 0 acciones pendientes',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontFamily: 'Open Sans',
                            color: const Color(0xFF228F22)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: IconButton(
                        splashRadius: 30,
                        iconSize: 60,
                        icon: const Icon(
                          Icons.message_outlined,
                          color: Colors.black,
                          size: 34,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(34, 8, 0, 0),
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: const Color(0xFF43FF43),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
