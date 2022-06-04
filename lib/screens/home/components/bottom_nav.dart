import 'package:flutter/material.dart';
import 'package:gestor_fct/constants.dart';
import 'package:gestor_fct/screens/settings/settings.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
      child: SizedBox(
        width: double.infinity,
        height: 80,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        splashRadius: 30,
                        iconSize: 60,
                        icon: const Icon(
                          Icons.home_filled,
                          color: buttonPrimary,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        splashRadius: 30,
                        iconSize: 60,
                        icon: const Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                      const Spacer(),
                      IconButton(
                        splashRadius: 30,
                        iconSize: 60,
                        icon: const Icon(
                          Icons.article,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        splashRadius: 30,
                        iconSize: 60,
                        icon: const Icon(
                          Icons.settings_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF228F22),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    splashRadius: 30,
                    iconSize: 60,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
